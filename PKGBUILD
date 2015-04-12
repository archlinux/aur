# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Xentec <artificial.i7 at gmail dot com>

pkgname=glbinding
pkgver=1.1.0
pkgrel=1
pkgdesc="A C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64')
url="http://www.glbinding.org"
license=('MIT')
depends=('libgl')
makedepends=('cmake' 'mesa')
source=($pkgname-$pkgver.tar.gz::"https://github.com/hpicgs/glbinding/archive/v$pkgver.tar.gz")
sha256sums=('2e34024b9b5d4c6a1db9326634f77c1eaab179c36382cb2a5f005c7ec702e8b9')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DOPTION_BUILD_TESTS=OFF
  make
}

package() {
  cd $pkgname-$pkgver

  make -C build DESTDIR="$pkgdir/" install

  rm -r "${pkgdir}/usr/share/"
  install -Dm644 $pkgname-config.cmake "$pkgdir"/usr/lib/cmake/$pkgname/$pkgname-config.cmake
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 README.md AUTHORS "$pkgdir"/usr/share/doc/$pkgname
}
