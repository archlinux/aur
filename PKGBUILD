# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coretime
pkgver=5.0.0
pkgrel=1
pkgdesc="A time related task manager from the C Suite."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-multimedia'
        'hicolor-icon-theme'
        'libcprime'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5b8169ef13a6a04e5b979b4eec3e8133114a84ddfab26267375f79dd0e778182')

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
