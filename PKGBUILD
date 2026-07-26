# Maintainer: w568w <w568w at outlook dot com>
pkgname=opencode-claude-auth
pkgver=2.1.2
pkgrel=1
pkgdesc="Claude Code credential bridge plugin for opencode"
arch=('any')
url="https://github.com/griffinmartin/opencode-claude-auth"
license=('MIT')
depends=('nodejs' 'opencode')
makedepends=('npm')
optdepends=('claude-code: This plugin reads credentials from official CLI')
options=('!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69e19964c819284aa6792619cc89d5aaf29bb47613c9768b501933718f530c98')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r dist "$pkgdir/usr/lib/opencode/plugins/$pkgname/"
  install -Dm644 opencode-claude-auth.js "$pkgdir/usr/lib/opencode/plugins/$pkgname/opencode-claude-auth.js"
  install -Dm644 package.json "$pkgdir/usr/lib/opencode/plugins/$pkgname/package.json"
  install -Dm644 README.md "$pkgdir/usr/lib/opencode/plugins/$pkgname/README.md"
  install -Dm644 installation.md "$pkgdir/usr/lib/opencode/plugins/$pkgname/installation.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
