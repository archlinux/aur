# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corestuff
pkgver=4.2.0
pkgrel=1
pkgdesc="An activity viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxcomposite' 'kglobalaccel' 'libcsys>=2.7.1' 'libcprime>=2.7.1')
makedepends=('cmake' 'ninja')
replaces=('corebox')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('728ee1f869955c3bd25811d89b2bfb12')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	-DCMAKE_INSTALL_LIBDIR=${pkgdir}/usr/lib
  ninja
}

package() {
  cd build
  ninja install
} 
