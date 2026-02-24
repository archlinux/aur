# Maintainer: gucio321
pkgname=excel2tex
pkgver=3.3.1
pkgrel=2
pkgdesc="Convert MS Excel/LibreOffice Calc table to LaTex."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/gucio321/excel2tex"
options=(!lto)
license=('WTFPL')
depends=(
  'libx11'
)
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gucio321/excel2tex/archive/v${pkgver}.tar.gz")
sha256sums=('31dffcc9fecdbb335971b4ab754f906cc55af48646a9787bc577490ee8f4a516')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -mod=readonly -modcacherw -v .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 excel2tex $pkgdir/usr/bin/excel2tex
}
