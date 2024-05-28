# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-one-thing-git
pkgver=13.0.0.r12.g31d061b
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

package() {
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
    cd "${srcdir}/${pkgname%-git}"
    rm -rf .git* README.md .eslintrc.yml lint package*.json
    cd "${srcdir}"
    cp -r ${pkgname%-git} "${pkgdir}/usr/share/gnome-shell/extensions/one-thing@github.com"
}
# vim:set ts=4 sw=4 et:
