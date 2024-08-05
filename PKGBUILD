# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.10.0
pkgrel=2
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://github.com/acaloiaro/di-tui'
license=('BSD')
depends=('pulse-native-provider')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/acaloiaro/di-tui/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ad59b529eddcb0fbb82b67dc483b8de43960ecd5f133a7dda65577863ade3f0898167eee267070f427f6681313c3aadb789677bfa692caf4e839617e42dfb87f')

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
