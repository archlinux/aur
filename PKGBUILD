# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>

pkgname='dockfmt'
pkgver='v0.3.3'
pkgrel=1
pkgdesc='Dockerfile format and parser. Like `gofmt` but for Dockerfiles.'
arch=('x86_64')
url="https://github.com/jessfraz/$pkgname"
license=('MIT')
depends=()
makedepends=('go')
provides=('dockfmt')
conflicts=('dockfmt')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  go mod vendor
}

build() {
  cd "$srcdir/$pkgname"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
