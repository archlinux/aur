# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex
pkgver=0.8.0
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl_mixer>=1.2.6' 'wxgtk' 'miniupnpc')
makedepends=('cmake')
optdepends=('timidity++: Required for music')
source=("http://downloads.sourceforge.net/odamex/odamex-src-${pkgver}.tar.gz"
        0001-Fix-WAD-path.patch)
sha256sums=('52b4d0ba504edfea53e24d8b19c86da6f7e3b75980c3133eb6b5e97d24a606ea'
            'c4ce4072515c7dbfe65d1829a317d21b5f1091e04997761cdfee345a60141638')

prepare() {
  cd $pkgname-src-$pkgver
  patch --forward --strip=1 --input="${srcdir}/0001-Fix-WAD-path.patch"
}

build() {
  cd $pkgname-src-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release                              \
        -DCMAKE_INSTALL_PREFIX=/usr                             \
        .
  make
}

package() {
  cd $pkgname-src-${pkgver}
  make DESTDIR=$pkgdir install
  # Use system headers.
  rm -r "$pkgdir/usr/include/miniupnpc/"
}

# vim:set ts=2 sw=2 et:
