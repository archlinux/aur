# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-antigravity-auth
pkgver=1.4.2
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
sha256sums=('a24154eba00b375782112a7d91fe0a7a809436a93aee32dda8d90b14d1ff2264')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
