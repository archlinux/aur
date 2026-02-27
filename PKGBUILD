# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-gemini-auth
pkgver=1.4.5
pkgrel=1
pkgdesc="Google Gemini OAuth Plugin for opencode"
arch=('any')
url="https://github.com/jenslys/opencode-gemini-auth"
license=('MIT')
depends=('opencode' 'npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    local latest
    latest=$(curl -fsSL "https://api.github.com/repos/jenslys/opencode-gemini-auth/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('039b46214d7324b7b5ce8da71a8ead729654ab27815836e814fd0242fbc9ef24')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
