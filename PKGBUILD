# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=coregarage
pkgver=5.0.0
pkgrel=1
pkgdesc="A settings manager for the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
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
sha256sums=('d80686fde1d92ad90072e353639452f7de0d91cd13cb649bc9a4816e835f2e5d')

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
