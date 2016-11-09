# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgbase=hardcode-tray-fixer
pkgname=$_pkgbase-git
pkgver=r718.1e5917f
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL')
provides=("$_pkgbase")
makedepends=('git')
depends=('python' 'python-gobject' 'python-cairosvg' 'librsvg' 'gtk3')
optdepends=('sni-qt-eplus-bzr: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape')
optdepends_x86_64=('lib32-sni-qt-eplus-bzr: 32-bit patched qt4 sni plugin to enable icon modification')
source=("$pkgname::git://github.com/bil-elmoussaoui/Hardcode-Tray" "hardcode-tray-fixer.sh")
sha256sums=('SKIP'
            '2df8935eae4644ffc29554a067fdc3fb3ba61b74ae6135dad4154a9c1c45c4a9')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 "$srcdir/hardcode-tray-fixer.sh" "$pkgdir/usr/bin/hardcode-tray"
  install -Dm755 "$srcdir/$pkgname/script.py" "$pkgdir/opt/$_pkgbase/script.py"
  install -d "$pkgdir/opt/$_pkgbase"
  cp -r "$srcdir/$pkgname/database" "$pkgdir/opt/$_pkgbase"
}
