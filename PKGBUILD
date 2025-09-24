# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.11.3
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://github.com/acaloiaro/di-tui'
license=('BSD')
depends=('pulse-native-provider')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/acaloiaro/di-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7de73a93bb3d6b1d315d479d9e118f088b80a3fe66d27249fa1a9487e131aea410d43d7d16ee6910d22501a7bbff7f434525da02c8d7820104bf0b5fbaf822ec')

build() {
  export GOPATH="$srcdir"
  cd $pkgname-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
