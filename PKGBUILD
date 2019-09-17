# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=grafana-plugin-multibar-graph-panel-git
pkgver=0.2.5.r6.2b81b0b
pkgrel=1
pkgdesc="A grafana graph panel plugin supporting bars side by side"
arch=('any')
url="https://github.com/CorpGlory/grafana-multibar-graph-panel"
license=('MIT')
depends=('grafana')
makedepends=('git' 'npm') 
source=('grafana-plugin-multibar-graph-panel::git+https://github.com/CorpGlory/grafana-multibar-graph-panel.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  npm install
}

build() {
  cd "$srcdir/${pkgname%-git}"
  npm run build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "$pkgdir/var/lib/grafana/plugins/multibar-graph-panel"
  cp -av dist/* "$pkgdir/var/lib/grafana/plugins/multibar-graph-panel"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
