# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ortp-git
_pkgname=ortp
pkgver=4.5.0.alpha.r7.g607b2e7
pkgrel=1
pkgdesc="A Real-time Transport Protocol (RTP) library"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/ortp"
license=('GPL3')
conflicts=('ortp')
provides=("ortp=$pkgver")
depends=('bctoolbox>=4.4.0')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelledonneCommunications/ortp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cmake -B build "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC="NO" \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
