# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ccase"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=('x86_64')
url="https://github.com/rutrum/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('507433b065f4daa9d69b7d1b8be1c23acde51b99fd0946fe658e1866493c5b94')
sha256sums_x86_64=('a5386d8907163671f318ea8f73574e3df3d8d8b99b4d757b20150cc6d2b23c57')

prepare() {
  cd "${srcdir}"
  [ -d "data" ] || mkdir "data"
  tar xvf "data.tar.xz" -C "${srcdir}/data"
}

package() {
  cd "${srcdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "data/usr"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
