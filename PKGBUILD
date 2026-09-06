# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=tabbed
pkgname=sarbs-tabbed-git
pkgver=2026.09.06.r10.g2730b5c
pkgrel=1
pkgdesc="Sergi's Build von tabbed, dem Suckless-Tab-Frontend (Teil von SARBS)"
arch=('x86_64')
url="https://codeberg.org/Sergius/tabbed"
license=('MIT')
depends=('libx11' 'fontconfig' 'libxft')
makedepends=('git')
provides=('tabbed')
conflicts=('tabbed')
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
