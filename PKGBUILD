# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-window-thumbnails-git
pkgver=r38.a885f32
pkgrel=1
pkgdesc="A GNOME Shell extension that allows the creation of scaled-down window clones for use as Picture-in-Picture (PIP) thumbnails (Github version)."
arch=('any')
url="https://github.com/G-dH/window-thumbnails"
license=('GPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gnome-shell')
makedepends=('git')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make zip
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/window-thumbnails@G-dH.github.com"
    bsdtar -xf "window-thumbnails@G-dH.github.com.zip" \
        -C "${pkgdir}/usr/share/gnome-shell/extensions/window-thumbnails@G-dH.github.com"
}
# vim:set ts=4 sw=4 et:
