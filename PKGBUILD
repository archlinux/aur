# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=5.3.0
pkgrel=1
pkgdesc='A string template engine based on the Django template system and written in Qt'
arch=(x86_64)
url='https://github.com/steveire/grantlee'
license=(LGPL2.1)
depends=(qt5-declarative)
makedepends=(cmake doxygen graphviz)
source=(http://downloads.grantlee.org/grantlee-$pkgver.tar.gz{,.asc})
sha256sums=('8c52cd4b0fa86f2bb0a3627d6bee8286f269cd7122a0115101cdec9441669ff2'
            'SKIP')
validpgpkeys=(FCA530E51EE4331C2DF16637D264C7B1D02D6509) # Stephen Kelly <steveire@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  cmake --build build
  cmake --build build --target docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 build/apidox/* -t "$pkgdir"/usr/share/doc/$pkgname
}
