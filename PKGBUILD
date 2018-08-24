# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='aqua-git'
pkgver=r4.69afc23
pkgrel=1
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=(any)
license=(GPL3)
url=https://github.com/EliverLara/Aqua
source=("${pkgname%-git}"::"git+https://github.com/EliverLara/Aqua")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package(){
    install -d "$pkgdir/usr/share/themes/aqua"
    cp -a $srcdir/${pkgname%-git}/* "$pkgdir/usr/share/themes/aqua"
    rm -rf $pkgdir/usr/share/themes/aqua/.git
}