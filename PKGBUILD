# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corepdf
pkgver=4.5.0
pkgrel=2
pkgdesc="A PDF viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'poppler-qt5'
        'hicolor-icon-theme'
        'libcprime>=2.7.1'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6eaa28a2202a3320f2f2f56f14bb7c79078945d294dc2f22aa39478273e3eebe')

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
