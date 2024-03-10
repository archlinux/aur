# Maintainer:
# Contributor: Phoney Badger <phoneybadgercode.4ikc7 at simplelogin.co>

_pkgname=pokemon-colorscripts
pkgname="$_pkgname-git"
pkgver=r112.0483c85b
pkgrel=1
pkgdesc="Print Pokemon ASCII art in the terminal"
url="https://gitlab.com/phoneybadger/pokemon-colorscripts"
license=('MIT')
arch=('any')

depends=('python')
makedepends=('git')

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver(){
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

package() {
  local _install_path="opt"

  cd "$_pkgsrc"

  # program files
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp -rf colorscripts "$pkgdir/$_install_path/$_pkgname/"
  install -Dm755 pokemon-colorscripts.py -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 pokemon.json -t "$pkgdir/$_install_path/$_pkgname/"

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/$_pkgname/pokemon-colorscripts.py" "$pkgdir/usr/bin/pokemon-colorscripts"

  # man page
  install -Dm644 pokemon-colorscripts.1 "$pkgdir/usr/share/man/man1/pokemon-colorscripts.1"

  # license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
