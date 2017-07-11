# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gnome-shell-extension-blyr-git
pkgver=r9.3ab5360
pkgrel=1
pkgdesc="Adds a Blur Effect to GNOME Shell UI Elements."
arch=(any)
url="https://github.com/yozoon/gnome-shell-extension-blyr"
license=(LGPL3)
depends=('gnome-shell>=3.20')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git')
install='gnome-shell-extension.install'
source=("${pkgname%-git}"::"git+https://github.com/yozoon/gnome-shell-extension-blyr")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "$srcdir/${pkgname%-git}/blyr@yozoon.dev.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions/"
  chmod 666 "$pkgdir/usr/share/gnome-shell/extensions/blyr@yozoon.dev.gmail.com/shader.glsl"
}
