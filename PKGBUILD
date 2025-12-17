
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-openai-codex-auth
pkgver=4.1.1
pkgrel=1
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
    latest=$(curl -fsS "https://api.github.com/repos/numman-ali/opencode-openai-codex-auth/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01e31ef4c97813a0c3b63ac7b25e4ffbf2a334b93186f780f82516a40dc64131')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
}
