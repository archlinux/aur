# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-antigravity-auth
pkgver=1.3.0
pkgrel=1
pkgdesc="Google Antigravity OAuth Plugin for opencode"
arch=('any')
url="https://github.com/NoeFabris/opencode-antigravity-auth"
license=('MIT')
depends=('opencode')
makedepends=('npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    local latest
    latest=$(curl -fsSL "https://api.github.com/repos/NoeFabris/opencode-antigravity-auth/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8601a54b2f02b4e597c8624e54eb611756e443811fbf3beb4ef998b83d2dcd07')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
