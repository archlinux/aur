# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=2.0
pkgrel=2
pkgdesc='A static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/nasa-sw-vnv/ikos'
license=('custom:NOSA 1.3')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'llvm40'
         'llvm40-libs'
         'clang40'
         'apron-ppl-svn')
makedepends=('cmake'
             'boost')
source=("https://github.com/nasa-sw-vnv/ikos/releases/download/v$pkgver/ikos-$pkgver.tar.gz")
sha256sums=('03a93794651e51e639c47b8ef821f923f7951a11669a7ad3230a68f5f27e1c5f')

prepare() {
  cd "$srcdir/ikos-$pkgver"
  mkdir build
}

build() {
  cd "$srcdir/ikos-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config-4.0" \
    ..
  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/ikos-$pkgver/LICENSE.pdf" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}

check() {
  cd "$srcdir/ikos-$pkgver/build"
  make check
}
