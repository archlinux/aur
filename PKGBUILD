# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=gonzales-git
pkgver=0.2.0.r1100.g5e4d3c2
pkgrel=1
pkgdesc="High-performance Swift path tracer"
arch=('x86_64')
url="https://github.com/gonsolo/gonzales"
license=('GPL3')

depends=('swift-bin' 'embree' 'openimageio' 'ptex' 'zlib')
makedepends=('git' 'make' 'pkg-config')

source=("git+https://github.com/gonsolo/gonzales.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/gonzales"
  echo "--- Building Release Binary ---"
  make release
}

check() {
  cd "$srcdir/gonzales"
  echo "--- Running Optimized Tests ---"
  make test_release || make test # Adjust based on your Makefile targets
}

package() {
  cd "$srcdir/gonzales"
  install -Dm755 .build/release/gonzales "$pkgdir/usr/bin/gonzales"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
