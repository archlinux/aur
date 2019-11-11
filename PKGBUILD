# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-git
_pkgname=belle-sip
pkgver=1.6.3.r236.g8556897
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL3')
depends=('avahi' 'bctoolbox-git' 'gcc-libs' 'zlib')
makedepends=('cmake' 'git')
provides=("belle-sip=$pkgver")
conflicts=('belle-sip')
options=('!emptydirs')
source=("git+https://github.com/BelledonneCommunications/belle-sip.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DENABLE_STATIC=NO \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES \
        -DENABLE_TESTS=NO .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
