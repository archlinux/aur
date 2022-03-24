# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
pkgname=zer0
pkgver=1.0.0
pkgrel=1
pkgdesc="Client for zer0bin"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zer0bin-dev/zer0"
options=(!lto)
license=('MIT')
depends=(
  'git'
  'man-db'
)
makedepends=('go>=1.18')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zer0bin-dev/zer0/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sudo go build -o /usr/bin/zer0
  sudo mv ./zer0.1.gz /usr/share/man/man1/zer0.1.gz
  mandb
}
