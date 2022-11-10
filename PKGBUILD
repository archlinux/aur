# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >

pkgname=gnome-shell-extension-ddterm-git
pkgver=40.r14.g2e27988
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell (Github version)."
arch=('any')
url="https://github.com/ddterm/${pkgname%-git}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('gettext'  'git' 'libxslt' 'npm' 'zip')
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    npm install --omit dev --cache "${srcdir}/npm-cache"
}

build() {
    cd "${pkgname%-git}"
    make pack
}

package() {
    cd "${pkgname%-git}"
    local _uuid="ddterm@amezin.github.com"
    local dest="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
    install -d "${dest}"
    bsdtar --no-same-owner -xvf ${_uuid}.shell-extension.zip -C "${dest}"
}
# vim:set ts=4 sw=4 et:
