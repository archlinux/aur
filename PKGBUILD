# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corefm
pkgver=4.5.0
pkgrel=2
pkgdesc="A lightwight filemanager from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'hicolor-icon-theme'
        'libcprime>=2.7.1'
        'libcsys>=2.7.1'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('aeb15e3d80e5c5b4f83540a7786ac7a43c992fa76a097a8052bf4c70e7410a02')

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
