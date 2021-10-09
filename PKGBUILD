# Maintainer : masutu <masutu dot arch at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=portsmf-git
_pkgname=portsmf
pkgver=239.r2.g9e71366
pkgrel=1
pkgdesc="Portable library for reading/writing Standard MIDI Files"
arch=('x86_64')
url="https://github.com/tenacityteam/portsmf"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=('portsmf')
conflicts=('portsmf')
options=('!staticlibs')
source=("portsmf::git+https://github.com/tenacityteam/portsmf.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -S . -B build
  cmake --build build
}

package() {
  cd ${_pkgname}
  make -C build DESTDIR="${pkgdir}" install
  install -vDm 644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
