# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.7.5
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
depends=(unzip)
optdepends=()
conflicts=()
if test "$CARCH" == i686; then
source=("${_name}-${pkgver}.zip::https://dl.bintray.com/mitchellh/packer/${_name}_${pkgver}_linux_386.zip")
sha256sums=('6a6ee79d51909f04f734c15a0e12ebcaba3f2cf4d449906f6a186490774262f9')
else
source=("${_name}-${pkgver}.zip::https://dl.bintray.com/mitchellh/packer/${_name}_${pkgver}_linux_amd64.zip")
sha256sums=('8fab291c8cc988bd0004195677924ab6846aee5800b6c8696d71d33456701ef6')
fi
noextract=(${source[@]%%::*})

prepare() {
  if [[ -e ${srcdir}/${_name}-${pkgver} ]]; then rm -rf ${srcdir}/${_name}-${pkgver}; fi
  mkdir ${srcdir}/${_name}-${pkgver}
  unzip -o ${_name}-${pkgver}.zip -d ${srcdir}/${_name}-${pkgver}
}

package() {
  install -dm755 "${pkgdir}/usr/bin"

  cd "${srcdir}/${_name}-${pkgver}"
  for file in `ls ${srcdir}/${_name}-${pkgver}`; do
    if [ "$file" == "packer" ]; then
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}-io"
    else
      install -Dm755 "$file" "${pkgdir}/usr/bin/${file}"
    fi
  done
}
