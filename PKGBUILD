# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://github.com/acaloiaro/di-tui'
license=('BSD')
depends=('pulseaudio')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/acaloiaro/di-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('126b6dc9e57535eb1825865733a14aa36bab870c0748d0e86bf679ebe793221ba9645ddaeefaf46aa76e6fa4d356949bdfd0dbe034315aa5dc280dbe2dc154f2')

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
