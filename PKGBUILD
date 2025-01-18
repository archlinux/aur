# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corearchiver
pkgver=4.5.0
pkgrel=2
pkgdesc="Archiver from the C Suite to create and extract archives"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libcprime>=2.7.1'
        'libarchive-qt'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d44d67fd3ef6a3365f9203fac13e79a2c438f23daf8e1e9e4bfac26946f69eb1')

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
