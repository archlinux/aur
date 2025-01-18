# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coretime
pkgver=4.5.0
pkgrel=2
pkgdesc="A time related task manager from the C Suite."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libcprime>=2.7.1'
        'qt5-multimedia'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('0c39985f88b170c4503a0e48673789729e4f8de2d4283df65ff6cf0a3ba5a96d')

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
