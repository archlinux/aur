# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-gemini-auth
pkgver=1.4.14
pkgrel=1
pkgdesc="Google Gemini OAuth Plugin for opencode"
arch=('any')
url="https://github.com/jenslys/opencode-gemini-auth"
license=('MIT')
depends=('opencode' 'npm')
options=('!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

latestver() {
    gh api --paginate repos/jenslys/opencode-gemini-auth/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3983a5b45618cb14bd8113fd4d7c6eb8f4d066e96a1e9bf222ae7e3818b6136a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
