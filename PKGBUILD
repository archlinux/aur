# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=vouch-proxy
pkgver=0.34.0
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
  ./do.sh install
}

package() {
  install -Dm755 $pkgname-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$srcdir"/vouch-proxy.service "$pkgdir"/usr/lib/systemd/system/vouch-proxy.service
}

sha256sums=('3fd4fe8332f3908e44802484f051b14999b094005399c3cecc2b7ca7942ef46c'
            'f278afaa8053181956b1b11fe156207fc56817aae7c8d145434a305662b25aa7')
