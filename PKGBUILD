# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coreterminal
pkgver=5.0.0
pkgrel=1
pkgdesc="A terminal emulator from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-serialport'
        'hicolor-icon-theme'
        'libcprime'
        'qtermwidget'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('4712d67c0fef529d3496daf5ac816490a0194d5e0d080d740ee12c2199ed34c3')

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
