# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=libcprime
pkgver=5.0.0
pkgrel=2
pkgdesc="A library for bookmarking, saving recent activites, managing settings of C-Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=(
            'cmake'
            'ninja'
)
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b9bfc079b98861045f69477985784543d0396996a53d231931e44463e8c36f57')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
