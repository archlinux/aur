# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributer: Alexander Mezin <mezin.alexander at gmail dot com>
pkgname=gnome-shell-extension-ddterm-git
pkgver=50.r13.g03d9ff0
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell (Github version)."
arch=('any')
url="https://github.com/ddterm/${pkgname%-git}"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gnome-shell' 'gtk3' 'vte3')
makedepends=('meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${pkgname%-git}" build

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -- meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

# vim:set ts=4 sw=4 et:
