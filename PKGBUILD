# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=vouch-proxy
pkgver=0.36.0
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

sha256sums=('087aaf72e7e732c8a9320ce046f7c804d8d6b3a643fbe8c69d90260846bd7d70'
            'f278afaa8053181956b1b11fe156207fc56817aae7c8d145434a305662b25aa7')
