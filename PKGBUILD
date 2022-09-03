# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=vouch-proxy
pkgver=0.37.3
pkgrel=1
pkgdesc="an SSO and OAuth / OIDC login solution for Nginx using the auth_request module"
arch=('x86_64')
url="https://github.com/vouch/vouch-proxy"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz" "vouch-proxy.service")

_DO="./do.sh"

build() {
  cd $pkgname-$pkgver
  $_DO goget
  $_DO gobuildstatic
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "$srcdir"/vouch-proxy.service "$pkgdir"/usr/lib/systemd/system/vouch-proxy.service
  install -dm755 "$pkgdir"/usr/bin
  GOPATH="$pkgdir"/usr $_DO install
}

sha256sums=('141ecce4656425dd1ca6cb606c7633b9ec0e3ff0d1c873a81398c6969bdbe197'
            'f278afaa8053181956b1b11fe156207fc56817aae7c8d145434a305662b25aa7')
