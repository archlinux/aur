# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corestats
pkgver=4.5.0
pkgrel=2
pkgdesc="A system resource viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libcprime>=2.7.1'
        'libcsys>=2.7.1'
        'lm_sensors'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a474d5890eca310895a568a2f7f328539a83b012696b74541c15504e893ee3a4')

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
