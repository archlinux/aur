# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-git
_pkgname=belle-sip
pkgver=4.5.0.alpha.r34.g1eeaf02
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'bctoolbox>=4.5')
makedepends=('cmake' 'git')
provides=("belle-sip=$pkgver")
conflicts=('belle-sip')
options=('!emptydirs')
source=("git+https://github.com/BelledonneCommunications/belle-sip.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cmake -B build $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=NO \
    -DENABLE_MDNS=YES \
    -DENABLE_STRICT=YES \
    -DENABLE_TESTS=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
}
