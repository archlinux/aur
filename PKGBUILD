# Maintainer: Marvin Kreis <MarvinKreis@web.de>

pkgname=rofi-json-menu-git
pkgver=0.2.0.r0.ga5516ac
pkgrel=1
pkgdesc="A plugin to use rofi for custom menus"
arch=("x86_64")
url="https://github.com/marvinkreis/${pkgname%-git}"
license=("MIT")
depends=("rofi" "json-c")
makedepends=("git" "cmake")
provides=("rofi-json-menu")
replaces=("rofi-prompt")
source=("git+https://github.com/marvinkreis/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
