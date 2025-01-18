# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corestuff
pkgver=4.5.0
pkgrel=3
pkgdesc="An activity viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-x11extras'
        'hicolor-icon-theme'
        'libxcomposite'
        'libxi'
        'libxcb'
        'libx11'
        'xcb-util-wm'
        'kglobalaccel5'
        'libcsys>=2.7.1'
        'libcprime>=2.7.1'
)
makedepends=(
            'cmake'
            'ninja'
)
replaces=('corebox')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('637bee8cdfa79227a446a8e3f7bab92c0d1e8102c42d8021b5908b24b51433ca')

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
