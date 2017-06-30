# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-dynamic-battery-git
pkgver=r20.7eab1ac
pkgrel=1
pkgdesc="Dynamic Battery extension for GNOME Shell."
arch=(any)
url="https://github.com/Exalm/gnome-shell-extension-dynamic-battery"
license=(GPL2)
depends=('gnome-shell>=3.20')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
makedepends=(git)
install='gnome-shell-extension.install'
source=("${pkgname%-git}"::"git+https://github.com/Exalm/gnome-shell-extension-dynamic-battery")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  glib-compile-schemas "dynamic_battery@exalm"/schemas
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "dynamic_battery@exalm" "$pkgdir/usr/share/gnome-shell/extensions/"
}
