# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=3.0
pkgrel=1
pkgdesc='Static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/nasa-sw-vnv/ikos'
license=('custom:NOSA 1.3')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'intel-tbb'
         'llvm'
         'llvm-libs'
         'clang'
         'apron')
makedepends=('cmake'
             'boost')
source=("https://github.com/nasa-sw-vnv/ikos/releases/download/v$pkgver/ikos-$pkgver.tar.gz")
sha256sums=('bd42e84061c207ea7ca7f0c7d7aafa3cce72e951d33953b0ed8d68133b17c8b6')

prepare() {
  cd "$srcdir/ikos-$pkgver"
  mkdir build
}

build() {
  cd "$srcdir/ikos-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config" \
    ..
  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/ikos-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}

check() {
  cd "$srcdir/ikos-$pkgver/build"
  make check
}
