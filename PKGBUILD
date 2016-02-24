# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_name=packer
pkgname=packer-io
pkgver=0.9.0
pkgrel=2
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
depends=(unzip)
optdepends=()
conflicts=()
if test "$CARCH" == i686; then
source=("${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_386.zip")
sha256sums=('f3b3dea98f7b7e852d4919074d7a3878f7cc7072338f18e3e5c5e55628b43bf1')
else
source=("${_name}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip")
sha256sums=('4119d711855e8b85edb37f2299311f08c215fca884d3e941433f85081387e17c')
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
