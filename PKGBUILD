# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Xentec <artificial.i7 at gmail dot com>

pkgname=glbinding
pkgver=1.0.5
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64')
url="https://github.com/hpicgs/glbinding"
license=('MIT')
depends=('libgl')
makedepends=('cmake' 'mesa')
source=($pkgname-$pkgver.tar.gz::"https://github.com/hpicgs/glbinding/archive/v$pkgver.tar.gz")
sha256sums=('b27e39315596491fd62fb580ee61f8683b3b25a63d2133fe1bab11cc61f066f8')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DOPTION_BUILD_TESTS=OFF -DOPTION_BUILD_STATIC=OFF
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
