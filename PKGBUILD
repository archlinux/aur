# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-git
_pkgname=belle-sip
pkgver=1.6.3.r189.g536c7c3
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL')
depends=('avahi' 'bctoolbox-git' 'gcc-libs' 'zlib')
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
        -DENABLE_STRICT=NO .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
