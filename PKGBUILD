# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.8.2
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
sha256sums=('dba50ad45afd6bf21b645a7cc71067a64b7b83db09c51a9b4707f47bf02c5c75')
else
source=("${_name}-${pkgver}.zip::https://dl.bintray.com/mitchellh/packer/${_name}_${pkgver}_linux_amd64.zip")
sha256sums=('a80ed2594ad0f57452730c07d631059dfd85c85f25b4fe8ff226dece26921243')
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
