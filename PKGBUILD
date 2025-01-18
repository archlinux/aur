# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coreshot
pkgver=4.5.0
pkgrel=2
pkgdesc="A screen capture utility from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-x11extras'
        'hicolor-icon-theme'
        'libx11'
        'libcprime>=2.7.1'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b8be153e3467d2ddc4d4270605dbd1cc9f86a1b551cf36c1b5ee5c53b8bec9dd')

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
