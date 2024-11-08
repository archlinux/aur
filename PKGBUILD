# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=privexchange-git
_pkgname="${pkgname%-git}"
pkgver=r6.3a6dea3
pkgrel=1
pkgdesc="Exchange your privileges for Domain Admin privs by abusing Exchange Resources"
arch=('any')
#url="https://github.com/dirkjanm/privexchange"
url="https://codeberg.org/killab33z/privexchange"
license=(MIT)
makedepends=('git')
depends=('python' 'impacket')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url"
        "privexchange.py")
sha512sums=('SKIP'
            'c015a9d11bf0d38075755b9bed9d4ffb781a68fac98783dc27ef60e9295112906833c0ab46ef078d556f85cbea8ec5ec32e6f483930e9c0ee8f6f4750bece3b0')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" $_pkgname/LICENSE
  install -Dm644 -t "$pkgdir/opt/$_pkgname" $_pkgname/README.md
  install -Dm755 "$srcdir/$_pkgname/$_pkgname.py" "$pkgdir/opt/$_pkgname/$_pkgname.py"
  install -Dm755 "$srcdir/$_pkgname/httpattack.py" "$pkgdir/opt/$_pkgname/httpattack.py"
  install -Dm755 "$srcdir/$_pkgname.py" "$pkgdir/usr/bin/$_pkgname.py"
}

