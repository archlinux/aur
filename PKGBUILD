# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corefm
pkgver=4.2.0
pkgrel=1
pkgdesc="A lightwight filemanager from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime>=2.7.1' 'libcsys>=2.7.1')
makedepends=('cmake' 'ninja')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('40546ea9b5cddec72e8c37dc6b1b58bc')

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
