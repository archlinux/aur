# Maintainer: Miguel Revilla Rodríguez <migrev at gmail dot com>
pkgname=opencode-qwencode-oauth
pkgver=1.0.3
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
sha256sums=('b0c39512bd41d5f0ea3721e171beaf2a16b82ba756271defb3414550c6192e0f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
