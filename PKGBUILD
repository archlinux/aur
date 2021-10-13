# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=vouch-proxy
pkgver=0.35.0
pkgrel=1
pkgdesc="an SSO and OAuth / OIDC login solution for Nginx using the auth_request module"
arch=('x86_64')
url="https://github.com/vouch/vouch-proxy"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz" "vouch-proxy.service")

build() {
  cd $pkgname-$pkgver
  ./do.sh goget
  ./do.sh gobuildstatic
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "$srcdir"/vouch-proxy.service "$pkgdir"/usr/lib/systemd/system/vouch-proxy.service
  install -dm755 "$pkgdir"/usr/bin
  GOPATH="$pkgdir"/usr ./do.sh install
}

sha256sums=('0abd258f52a9f59b050b1e0bd5170cc55be3c23d772ecbf6b1aa22493829b424'
            'f278afaa8053181956b1b11fe156207fc56817aae7c8d145434a305662b25aa7')
