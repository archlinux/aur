# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=tty-share
pkgver=0.6.1
pkgrel=2
pkgdesc="Shares terminal session with no setup on remote end (browser)"
arch=('any')
url="https://github.com/elisescu/tty-share"
license=('MIT')
depends=()
source=("https://github.com/elisescu/tty-share/archive/v${pkgver}.zip")
md5sums=('1b605d316d19c472b4ffaa9dc35405d4')
makedepends=('go-pie')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  go build -mod=vendor -trimpath -ldflags "-X main.version=${pkgver} --extldflags ${LDFLAGS}" -o tty-share .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 tty-share "$pkgdir/usr/bin"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
