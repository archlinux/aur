# Maintainer:

_pkgname="shell-color-scripts"
pkgname="$_pkgname-git"
pkgver=r113.576735c
pkgrel=1
pkgdesc="Collection of terminal color scripts"
url="https://gitlab.com/dwt1/shell-color-scripts"
license=('MIT')
arch=('i686' 'x86_64')

makedepends=('git')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgsrc"
  install -Dm755 colorscripts/* -t "$pkgdir/opt/$_pkgname/colorscripts/"
  install -Dm755 completions/* -t "$pkgdir/opt/$_pkgname/completions"
  install -Dm755 colorscript.sh "$pkgdir"/usr/bin/colorscript
  install -Dm644 colorscript.1 "$pkgdir/usr/man/man1/colorscript.1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
