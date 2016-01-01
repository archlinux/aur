# Maintainer: Jordan Klassen <forivall@gmail.com>

_pkgbase=hardcode-tray-fixer
pkgname=$_pkgbase-git
pkgver=r498.d426ba6
pkgrel=1
pkgdesc="Fixes Hardcoded Tray Icons"
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/Hardcode-Tray"
license=('GPL')
provides=("$_pkgbase")
makedepends=('git')
depends=('python' 'python-gobject' 'gtk3' 'sni-qt-eplus')
optdepends=('inkscape: to convert svg to png with inkscape' 'python-cairosvg: to convert svg to png with cairosvg')
optdepends_x86_64=('lib32-sni-qt-eplus: 32-bit application support')
source=("$pkgname::git://github.com/bil-elmoussaoui/Hardcode-Tray" "hardcode-tray-fixer.sh")
sha256sums=('SKIP'
            '5f33bc00c4994f4dc731ab810aff6f5474dd2bba655752b38a51ac282a73192f')

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
