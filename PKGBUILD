# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corekeyboard
pkgver=5.0.0
pkgrel=1
pkgdesc="A virtual keyboard for X11 from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libcprime'
        'libxtst'
        'libx11'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('79b732e9631a2a00c5ae77fb0bb6ecd1956dad2116c4d22a755094820f26306f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
