# Maintainer: p1rater p1rateracker@proton.me
pkgname=nanlang-git
pkgver=3.0.r1.g9a96983
pkgrel=1
pkgdesc="A high-performance, signal-driven system language for AVX2/ARM64 architectures."
arch=('x86_64' 'aarch64')
url="https://github.com/p1rater/NanLang.git"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'gcc' 'make')
provides=('nanlang')
conflicts=('nanlang')
source=('git+https://github.com/p1rater/NanLang.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/NanLang"
  ( git describe --long --tags || echo "3.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" ) | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/NanLang"
  make
}

package() {
  cd "$srcdir/NanLang"
  
  install -Dm755 nanlang "$pkgdir/usr/bin/nanlang"
  
  install -Dm644 README.md "$pkgdir/usr/share/doc/nanlang/README.md"
  install -Dm644 LEARNING.md "$pkgdir/usr/share/doc/nanlang/LEARNING.md"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
