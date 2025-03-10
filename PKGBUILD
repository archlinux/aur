# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coreaction
pkgver=5.0.0
pkgrel=1
pkgdesc="A side bar for showing widgets from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-svg'
        'hicolor-icon-theme'
        'libcprime'
        'libcsys'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('59ce7283bbb35798acacce9202ca9e535e38b03afb0735f5095336b072ab3556')

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
