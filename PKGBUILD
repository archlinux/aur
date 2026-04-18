# Maintainer: robertfoster
pkgname=opencode-tool-search
pkgver=0.4.3 # renovate: datasource=github-tags depName=M0Rf30/opencode-tool-search
pkgrel=1
pkgdesc="OpenCode plugin implementing Tool Search pattern - BM25 + regex search to discover tools on demand, reducing context usage"
arch=('any')
url="https://github.com/M0Rf30/opencode-tool-search"
license=('MIT')
depends=('opencode')
makedepends=('npm')
options=('!strip' '!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fa40c4b26e15c4b989faea4729bdbdef3ea2b9dd0af1c3581482cadf8617eb9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  local plugindir="$pkgdir/usr/lib/opencode/plugins/$pkgname"
  install -d "$plugindir"

  cp -r dist package.json "$plugindir/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
