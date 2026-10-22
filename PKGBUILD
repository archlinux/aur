# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-antigravity-auth
pkgver=2.1.1
pkgrel=1
pkgdesc="Google Antigravity OAuth Plugin for opencode"
arch=('any')
url="https://github.com/NoeFabris/opencode-antigravity-auth"
license=('MIT')
depends=('opencode')
makedepends=('npm')
options=('!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    gh api --paginate repos/NoeFabris/opencode-antigravity-auth/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36bbef51e76b42974c3612fbd150abeb605c634dac465da65d0f8498a30fa947')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
