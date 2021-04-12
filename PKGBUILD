# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=libcprime
pkgver=4.2.0
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of CoreApps."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'libnotify')
makedepends=('cmake' 'ninja')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('dfb55456a5fab6af20619a799900e4ee')

prepare() {
  #cd ${pkgname}-v${pkgver}
  mkdir -p build
}

build() {
  #cd ${pkgname}-v${pkgver}/build
  cd build
  cmake ../${pkgname}-v${pkgver} \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	-DCMAKE_INSTALL_LIBDIR=${pkgdir}/usr/lib
  ninja

  #qmake-qt5 ${pkgname}.pro
  #make
}

package() {
  cd build
  ninja install
  #cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr install
}
