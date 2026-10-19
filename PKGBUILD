# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.15.1
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://code.adriano.fyi/me/di-tui'
license=('BSD')
depends=('pulse-native-provider')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://code.adriano.fyi/me/di-tui/archive/v${pkgver}.tar.gz")
sha512sums=('836f0d39ed03d7d7d523e89363a22db4375b37902cbdc4730b0056210f747a294d40f73544c215b21826af6abea15446bcb3b2c6d42271c54f9ebe625d96a9b6')

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
