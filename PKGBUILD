# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname="vouch-proxy"
pkgver=0.41.0
pkgrel=1
pkgdesc="an SSO and OAuth / OIDC login solution for Nginx using the auth_request module"
arch=('x86_64')
url="https://github.com/vouch/vouch-proxy"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz" "vouch-proxy.service")

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

sha256sums=('4a2c623989f1c4def73912f8a44f70f7bf642eeb54535c81e9a2bbab04c464ec'
            'f4c79517e2eca2ca13756bf2c4fdafa7c2970195548151bf527178dfd8953603')
