# Maintainer: LinArcx <linarcx@gmail.com>

pkgname=gnome-shell-extension-show-desktop-button
pkgver=r4.8cf4f41
pkgrel=1
pkgdesc="Add Show Desktop Button to Gnome Panel."
arch=(any)
url="https://github.com/amivaleo/Show-Desktop-Button"
license=(GPL3)
depends=('gnome-shell>=3.24')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
makedepends=(git)
# install='gnome-shell-extension.install'
source=("${pkgname%-git}"::"git+https://github.com/amivaleo/Show-Desktop-Button")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/show-desktop-button@amivaleo"
  cp -a $srcdir/${pkgname%-git}/* "$pkgdir/usr/share/gnome-shell/extensions/show-desktop-button@amivaleo"
  rm -rf $pkgdir/usr/share/gnome-shell/extensions/show-desktop-button@amivaleo/.git
}