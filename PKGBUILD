# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname="vouch-proxy"
pkgver=0.45.0
pkgrel=1
pkgdesc="an SSO and OAuth / OIDC login solution for Nginx using the auth_request module"
arch=('x86_64')
url="https://github.com/vouch/vouch-proxy"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" "vouch-proxy.service")

_DO="./do.sh"

build() {
  cd "$pkgname-$pkgver"
  $_DO goget
  $_DO gobuildstatic
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "$srcdir"/vouch-proxy.service "$pkgdir"/usr/lib/systemd/system/vouch-proxy.service
  install -Dm755 vouch-proxy "$pkgdir"/usr/bin/vouch-proxy
}

sha256sums=('8a8c19a9d3cc62a292ece5a41e11f2ee432cb559be2bd4cb02e0bec49ce26433'
            'f4c79517e2eca2ca13756bf2c4fdafa7c2970195548151bf527178dfd8953603')
