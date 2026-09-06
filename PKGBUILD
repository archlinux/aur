# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=dwmblocks-async
pkgname=sarbs-dwmblocks-async-git
pkgver=2026.05.01.r84.g2e64357
pkgrel=1
pkgdesc="Asynchrone, modulare Statusbar für dwm (Teil von SARBS)"
arch=('x86_64')
url="https://codeberg.org/Sergius/dwmblocks-async"
license=('GPL')
depends=('libxcb')
makedepends=('git' 'pkgconf')
provides=('dwmblocks-async')
conflicts=('dwmblocks-async')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make PREFIX=/usr
}

package() {
  cd "$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
