
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-openai-codex-auth
pkgver=4.4.0
pkgrel=2
pkgdesc="OpenAI ChatGPT OAuth Plugin for opencode"
arch=('any')
url="https://github.com/numman-ali/opencode-openai-codex-auth"
license=('MIT')
depends=('opencode' 'npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    local latest
    latest=$(curl -fsSL "https://api.github.com/repos/numman-ali/opencode-openai-codex-auth/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b079725a336cd2e85bd9bce89d406009ba0deda5b2100871faaa6632698d015')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
