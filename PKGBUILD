# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ortp-git
_pkgname=ortp
pkgver=1.0.2.r67.g74feb19
pkgrel=1
pkgdesc="A Real-time Transport Protocol (RTP) library"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/ortp"
license=('GPL3')
conflicts=('ortp')
provides=('ortp')
depends=('bctoolbox-git')
makedepends=('cmake')
source=("git+https://github.com/BelledonneCommunications/ortp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DENABLE_STATIC="NO" \
      -DCMAKE_SKIP_INSTALL_RPATH=ON .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
