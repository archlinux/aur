# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-cronomix-git
pkgver=r728.83e9089
pkgrel=1
pkgdesc="All-in-one timer, stopwatch, pomodoro, alarm, todo and time tracker gnome-shell extension (Github version)."
arch=('any')
url="https://github.com/zagortenay333/cronomix"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gnome-shell')
makedepends=('git' 'typescript')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}/scripts"
    sed -i 's|^ext_dir=.*|ext_dir="./build/${uuid}"|' build
}

build() {
    cd "${srcdir}/${pkgname%-git}/scripts"
    ./build
    tsc
}
package() {
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
    cd "${srcdir}/${pkgname%-git}/build"
    rm 'cronomix@zagortenay333'/tsconfig.tsbuildinfo
    cp -r 'cronomix@zagortenay333' "${pkgdir}/usr/share/gnome-shell/extensions/"
}
# vim:set ts=4 sw=4 et:
