# Maintainer: Kritias <theodoridisgr@gmail.com>
pkgname=yarpgen
pkgver=v1.1.272.g700f5a2
pkgrel=1
pkgdesc="(Yet Another Random Program Generator) for stress testing compilers"
arch=('x86_64')
url="https://github.com/intel/yarpgen"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs') 
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/intel/yarpgen.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the latest commit's hash as a version
   git describe --always | sed 's/-/./g'
}


build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  install -Dm755 yarpgen "$pkgdir/usr/bin/yarpgen"
}

