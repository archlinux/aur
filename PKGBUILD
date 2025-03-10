# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corepdf
pkgver=5.0.0
pkgrel=1
pkgdesc="A PDF viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'poppler-qt6'
        'hicolor-icon-theme'
        'libcprime'
        'qdocumentview'
        'cups'
        'djvulibre'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b866354ad75c84fc50d061dbf1fa06e91e3a172fd5a856bf45a790d1c66f6dc5')

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
