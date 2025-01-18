# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coreaction
pkgver=4.5.0
pkgrel=2
pkgdesc="A side bar for showing widgets from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-svg'
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
sha256sums=('4a131da8e150ef2fd0c3d5d79714f2ff53653a4a543f796c4b7990cb36fa24e2')

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
