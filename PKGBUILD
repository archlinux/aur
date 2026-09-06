# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=Tomb
pkgname=sarbs-tomb-git
pkgver=2025.12.16.r1248.g648b008
pkgrel=1
pkgdesc="Zsh-Skript zum Anlegen und Verwalten verschlüsselter LUKS-Container (Särge)"
arch=('any')
url="https://github.com/dyne/Tomb"
license=('GPL-3.0-or-later')
depends=('zsh' 'cryptsetup' 'file' 'gnupg' 'sudo' 'pinentry')
optdepends=('gettext: Übersetzungen der Ausgaben')
makedepends=('git')
provides=('tomb')
conflicts=('tomb')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
