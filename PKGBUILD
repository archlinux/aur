# Maintainer: Sh1n4r4 <mitonohikari74@zohomail.com>
# Contributor: HolyC Compiler Community

pkgname=holyc
pkgver=0.1.0
pkgrel=1
pkgdesc="HolyC compiler written in Go - compiles HolyC source code to x64 machine code"
arch=('x86_64' 'aarch64')
url="https://github.com/Sh1n4r4/holyc-compiler"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sh1n4r4/holyc-compiler/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/holyc-go-$pkgver"
  
  # Set Go environment
  export GOPATH="$srcdir/go"
  export GOFLAGS="-mod=vendor"
  
  # Build the compiler
  go build -o holyc -v .
}

check() {
  cd "$srcdir/holyc-go-$pkgver"
  
  # Run tests if available
  go test -v ./... || true
}

package() {
  cd "$srcdir/holyc-go-$pkgver"
  
  # Install binary
  install -Dm755 holyc "$pkgdir/usr/bin/holyc"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install example files
  install -Dm644 test.hc "$pkgdir/usr/share/doc/$pkgname/examples/test.hc"
}

# vim:set ts=2 sw=2 et:
