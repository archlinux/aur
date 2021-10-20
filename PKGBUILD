# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail dot com
_pkgname=keepmenu
_gitname=keepmenu
pkgname=$_pkgname-git
pkgver=r176.dbcf6dc
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for Keepass databases."

arch=('any')
url="git+https://github.com/firecat53/keepmenu"
license=('GPL3')
depends=('python' 'python-pykeepass' 'python-pynput')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'xdotool: required for typing non-U.S. Unicode characters')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/keepmenu.1" "$pkgdir/usr/share/man/man1/keepmenu.1"
}
