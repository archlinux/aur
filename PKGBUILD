# Maintainer: robertfoster
pkgname=opencode-tool-search
pkgver=0.4.2 # renovate: datasource=github-tags depName=M0Rf30/opencode-tool-search
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
sha256sums=('062eed07203f53bc7137fe88461dde75b97501bf0af7b8b2396ff3aff3b72b39')

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
