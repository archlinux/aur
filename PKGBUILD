# Maintainer: gonsolo
pkgname=gonzales-git
pkgver=v0.2.r1.g990337b
pkgrel=1
pkgdesc="High-performance Swift path tracer (Embree/Ptex)"
arch=('x86_64')
url="https://github.com/gonsolo/gonzales"
license=('GPL3')

# Match these to your 'yay -Q' output
depends=('swift-bin' 'embree' 'openimageio' 'ptex' 'zlib')
makedepends=('git' 'make' 'pkg-config' 'swift-format' 'swiftlint')

source=("git+https://github.com/gonsolo/gonzales.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gonzales"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1g/;s/-/./g'
}

build() {
  cd "$srcdir/gonzales"
  # We use your existing release target
  echo "Building Gonzales with Swift $(swift --version | head -n1)"
  make release
}

check() {
  cd "$srcdir/gonzales"
  # Optional: Runs your 'make test' target during packaging
  make test
}

package() {
  cd "$srcdir/gonzales"
  
  # Install the binary produced by your Makefile
  install -Dm755 .build/release/gonzales "$pkgdir/usr/bin/gonzales"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
