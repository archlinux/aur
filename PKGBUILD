# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgbase=hardcode-tray-fixer
pkgname=$_pkgbase-git
pkgver=r675.2ea9b1b
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL')
provides=("$_pkgbase")
makedepends=('git')
depends=('python' 'python-gobject' 'gtk3')
optdepends=('sni-qt-eplus-bzr: patched qt4 sni plugin to enable icon modification' 'inkscape: to convert svg to png with inkscape' 'python-cairosvg: to convert svg to png with cairosvg')
optdepends_x86_64=('lib32-sni-qt-eplus-bzr: 32-bit patched qt4 sni plugin to enable icon modification')
source=("$pkgname::git://github.com/bil-elmoussaoui/Hardcode-Tray" "hardcode-tray-fixer.sh")
sha256sums=('SKIP'
            '856fd5bf57c67d055b4063bd56ea4d6f04274ae9903e341748522de397739078')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 "$srcdir/hardcode-tray-fixer.sh" "$pkgdir/usr/bin/$_pkgbase"
  install -Dm755 "$srcdir/$pkgname/script.py" "$pkgdir/opt/$_pkgbase/script.py"
  install -Dm644 "$srcdir/$pkgname/db.csv" "$pkgdir/opt/$_pkgbase/db.csv"
  install -d "$pkgdir/opt/$_pkgbase"
  cp -r "$srcdir/$pkgname/database" "$pkgdir/opt/$_pkgbase"
}
