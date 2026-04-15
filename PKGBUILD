# Maintainer: Miguel Revilla Rodríguez <migrev at gmail dot com>
pkgname=opencode-qwencode-oauth
pkgver=1.0.5
pkgrel=1
pkgdesc="Qwen OAuth authentication plugin for opencode with multi-account rotation"
arch=('any')
url="https://github.com/mseptiaan/opencode-qwencode-oauth"
license=('MIT')
depends=('opencode' 'npm')
options=('!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    gh api --paginate repos/mseptiaan/opencode-qwencode-oauth/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('364751606658675ca7a75414cb8a895c1bb0385b77860870e05aaa46475a3799')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
