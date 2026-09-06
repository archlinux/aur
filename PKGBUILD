# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=dotfiles
_destdir=sarbs-dotfiles
pkgname=sarbs-dotfiles-git
pkgver=2026.08.31.r199.g4db1c1c
pkgrel=1
pkgdesc="Sergi's Dotfiles (Teil von SARBS)"
arch=('any')
url="https://codeberg.org/Sergius/dotfiles"
license=('MIT')
depends=()
makedepends=('git')
provides=('sarbs-dotfiles')
conflicts=('sarbs-dotfiles')
install="$pkgname.install"
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # makepkg leert die Umgebung; ohne UTF-8-Locale warnt bsdtar
  # beim Packen der deutschen Dateinamen.
  export LC_ALL=C.utf8

  install -d "$pkgdir/usr/share/$_destdir"
  cp -a "$_gitname/." "$pkgdir/usr/share/$_destdir/"
  rm -rf "$pkgdir/usr/share/$_destdir/.git"

  install -Dm644 "$_gitname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
