# Maintainer: Theodoros Theodoridis <theodoridisgr@gmail.com>
pkgname=yarpgen
pkgver=v1.1.270.g0bfbe4f
pkgrel=1
pkgdesc="YARPGen (Yet Another Random Program Generator) for stress testing compilers"
arch=('x86_64')
url="https://github.com/intel/yarpgen"
license=('Apache')
depends=('gcc' 'cmake' 'make') # Update these dependencies based on your needs.
makedepends=('git')
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

