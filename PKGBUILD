# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.6.0
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://github.com/acaloiaro/di-tui'
license=('BSD')
depends=('pulseaudio')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/acaloiaro/di-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('47e2de15ee886045917b89829f325e42d9f40d4999991e7c18a5c0b700026d479cb1f441f0e9ab58d0efca1f99c6d3af414483ce000f27348c8504de8c06516c')

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
