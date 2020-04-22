# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=tty-proxy
pkgver=0.0.2
pkgrel=1
pkgdesc="Proxy for tty-share"
arch=('any')
url="https://github.com/elisescu/tty-proxy"
license=('MIT')
depends=()
source=("${url}/archive/v${pkgver}.zip")
md5sums=('5b37e94491a5bfe3a18eca85a7a9f2cf')
makedepends=('go-pie') # 'npm'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  go build -mod=vendor -trimpath -ldflags "-X main.version=${pkgver} --extldflags ${LDFLAGS}" -o tty-proxy .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 tty-proxy "$pkgdir/usr/bin"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
