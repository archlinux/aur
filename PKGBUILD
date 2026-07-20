# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.15.0
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://code.adriano.fyi/me/di-tui'
license=('BSD')
depends=('pulse-native-provider')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://code.adriano.fyi/me/di-tui/archive/v${pkgver}.tar.gz")
sha512sums=('51287d689c8c1a10251fbed2f3f9773e550f28c781d055fc5d8c6da337cdb915059cd7148579a97ba8bfd72c637fee37c35949d3aadb5cfb93d564ef513c07e4')

build() {
  export GOPATH="$srcdir"
  cd $pkgname

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
