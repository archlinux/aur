# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.8.6
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
sha256sums=('d1385af26ea42560ddc4f4958c88cb00c3e4a9f8a2d88a81c96b4bf1cb60369b')
else
source=("${_name}-${pkgver}.zip::https://dl.bintray.com/mitchellh/packer/${_name}_${pkgver}_linux_amd64.zip")
sha256sums=('2f1ca794e51de831ace30792ab0886aca516bf6b407f6027e816ba7ca79703b5')
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
