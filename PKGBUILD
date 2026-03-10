# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-gemini-auth
pkgver=1.4.8
pkgrel=3
pkgdesc="Google Gemini OAuth Plugin for opencode"
arch=('any')
url="https://github.com/jenslys/opencode-gemini-auth"
license=('MIT')
depends=('opencode' 'npm')
options=('!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    curl -fsSL 'https://api.github.com/repos/jenslys/opencode-gemini-auth/tags?per_page=100' | jq -r '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('462b5ed53983d7a9c86061a74b901ddfeb89c22e4f1660cf15f566e6ada1c59b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
