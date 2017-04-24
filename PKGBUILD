# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Xentec <xentec at aix0 dot eu>

pkgname=glbinding
pkgver=2.1.2
pkgrel=1
pkgdesc="A C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.glbinding.org"
license=('MIT')
depends=('libgl' 'glfw')
makedepends=('cmake' 'mesa')
checkdepends=('python')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cginternals/glbinding/archive/v$pkgver.tar.gz")
sha256sums=('d453d375d3e578fc5990ec41ad648d2ad3de73917a448ff6042bd9f555c0c0c0')

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

check() {
  cd $pkgname-$pkgver/build

  cmake .. -DOPTION_BUILD_TESTS=ON
  make
  make test
}

package() {
  cd $pkgname-$pkgver

  make -C build DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 README.md AUTHORS "$pkgdir"/usr/share/doc/$pkgname
}
