# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributer: Alexander Mezin <mezin.alexander at gmail dot com>
pkgname=gnome-shell-extension-ddterm-git
pkgver=49.r1.g6bf1ef9
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell (Github version)."
arch=('any')
url="https://github.com/ddterm/${pkgname%-git}"
license=('GPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gnome-shell' 'gtk3' 'vte3')
makedepends=('git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -- make build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
}
# vim:set ts=4 sw=4 et:
