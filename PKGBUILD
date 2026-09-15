# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

_pkgname=nsutils
pkgname="${_pkgname}-git"
pkgver=v0.2.r7.b573702
pkgrel=2

pkgdesc="Nsutils suite includes a number of utilities to list, add/remove tag, and join namespaces"
arch=('x86_64')
url='https://github.com/rd235/nsutils'
license=('GPL-2.0-or-later')
depends=('glibc' 'libcap')
makedepends=('git' 'cmake')
provides=('nsutils')
conflicts=('nsutils')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}/" describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}/"
  cmake -S . -B build/ \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "${srcdir}/${_pkgname}/build/"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/"
  install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build/"
  make DESTDIR="$pkgdir" install
}

