# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=libplatform-legacy
pkgver=1.0.10
pkgrel=2
pkgdesc="Platform support library used by add-ons for Kodi up to Jarvis"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/Pulse-Eight/platform"
license=('GPL')
makedepends=('cmake')
depends=('gcc-libs')
source=(https://github.com/Pulse-Eight/platform/archive/${pkgver}.tar.gz)
sha256sums=('6ba3239cb1c0a5341efcf9488f4d3dfad8c26d6b2994b2b2247e5a61568ab5cd')

build() {
  cd "$srcdir"/platform-${pkgver}
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
  make
}

package() {
  cd "$srcdir"/platform-${pkgver}
  make DESTDIR="$pkgdir/" install
}
