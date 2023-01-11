# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-one-thing-git
pkgver=5.0.0.r0.gc4b6e72
pkgrel=1
pkgdesc="Put a single task or goal in your GNOME Shell top bar (Github version)."
arch=('any')
url="https://github.com/dantehemerson/one-thing"
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
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make
}

package() {
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
    cd "${srcdir}/${pkgname%-git}"
    rm -rf Makefile .git* readme.md
    cd "${srcdir}"
    cp -r ${pkgname%-git} "${pkgdir}/usr/share/gnome-shell/extensions/one-thing@github.com"
}
# vim:set ts=4 sw=4 et:
