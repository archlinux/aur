# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net

_pkgname=keepmenu
_gitname=keepmenu
pkgname=$_pkgname-git
pkgver=r177.aecb894
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for Keepass databases."

arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPL3')
depends=('python' 'python-pykeepass' 'python-pynput')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'xdotool: required for typing non-U.S. Unicode characters')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

prepare() {
  git -C "$_gitname" clean -dfx
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/keepmenu.1" "$pkgdir/usr/share/man/man1/keepmenu.1"
}
