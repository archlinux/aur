# Maintainer: gucio321
pkgname=excel2tex
pkgver=3.3.0
pkgrel=6
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
sha256sums=('d8e9155c0d971cd4f74af577df139537d554ccb42748f13a3872e05eab783b2a')

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
