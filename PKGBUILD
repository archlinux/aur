# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corestuff
pkgver=5.0.0
pkgrel=1
pkgdesc="An activity viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libxcomposite'
        'libxi'
        'libxcb'
        'libx11'
        'xcb-util-wm'
        'kglobalaccel'
        'libcsys'
        'libcprime'
)
makedepends=(
            'cmake'
            'ninja'
)
replaces=('corebox')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b971a7d3fde332875f02fff28d4441944e75fa3dbf8787afcce1d85280ab1c40')

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
