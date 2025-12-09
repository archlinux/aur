
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-openai-codex-auth
pkgver=4.0.2
pkgrel=1
pkgdesc="OpenAI ChatGPT OAuth Plugin for opencode"
arch=('any')
url="https://github.com/numman-ali/opencode-openai-codex-auth"
license=('MIT')
depends=('opencode' 'npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

pkgver() {
    local latest
    latest=$(curl -fsS "https://api.github.com/repos/numman-ali/opencode-openai-codex-auth/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('235e70c4129c1906ed675634155be3f01d58fcaac4c70b16f786d7ac4217d482')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
}
