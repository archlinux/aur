# Maintainer: orange <?>
_pkgname='msigd'
pkgname=msigd-git
pkgver=r163.4b5c4f0
pkgrel=1
pkgdesc='MSI Gaming Device control application'
arch=('x86_64')
url="https://github.com/couriersud/${_pkgname}"
depends=('libusb' 'hidapi')
makedepends=('cmake' 'git')
license=('GPL')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make TARGETOS=arch
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
