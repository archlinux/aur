# Maintainer:  Siavosh Kasravi <siavosh.kasravi@gmail.com>

_appname="ControlFANs"

pkgname="controlfans-git"
pkgver=0.0.5.r9.g5114db0
pkgrel=1
pkgdesc="Configure FAN PWM via HWMON interface"
arch=("x86_64")
url="https://github.com/amedeos/${_appname}"
license=("GPL-3.0-only")
depends=("systemd" "qt5-base")
makedepends=("git")
provides=("controlfans")
conflicts=("controlfans")
source=(
    "${pkgname}::git+https://github.com/amedeos/${_appname}.git"
)
sha1sums=('SKIP')
options=('strip')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    qmake
    make
}

package() {
    install -Dm 755 "${pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
