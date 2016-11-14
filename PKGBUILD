
# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

_pkgbase=hardcode-tray-git
_gitname=Hardcode-Tray
pkgname=$_pkgbase
pkgver=r738.4e91e52
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL')
provides=("$_pkgbase")
makedepends=("git")
conflicts=("hardcode-tray-fixer-git" "hardcode-tray")
depends=('python' 'python-gobject' 'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-eplus-bzr: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape')
optdepends_x86_64=('lib32-sni-qt-eplus-bzr: 32-bit patched qt4 sni plugin to enable icon modification')
source=("git://github.com/bil-elmoussaoui/Hardcode-Tray")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 "$srcdir/$_gitname/script.py" "$pkgdir/opt/$_gitname/script.py"
  install -Dm755 "$srcdir/$_gitname/hardcode-tray" "$pkgdir/usr/bin/hardcode-tray"
  install -d "$pkgdir/opt/$_gitname"
  cp -r "$srcdir/$_gitname/database" "$pkgdir/opt/$_gitname"
}
