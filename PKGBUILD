# Maintainer: gucio321
pkgname=excel2tex
pkgver=3.3.0
pkgrel=1
pkgdesc="onvert Excel/LibreOffice Calc table to LaTex compatible tabularx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/gucio321/excel2tex"
options=(!lto)
license=('DWTFPL')
depends=(
  'libx11'
  'git'
)
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gucio321/excel2tex/archive/v${pkgver}.tar.gz")
#sha256sums=('7ea30d870a7c0e817376fa4ce42753ec201638eed958fe36a71abc0b31ff6a77')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  go build -v .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp excel2tex /usr/bin/
}
