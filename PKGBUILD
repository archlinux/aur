# Maintainer: Marvin Kreis <MarvinKreis@web.de>

pkgname=rofi-json-menu-git
pkgver=0.1.1
pkgrel=1
pkgdesc="A plugin to use rofi for custom menus"
arch=("x86_64")
url="https://github.com/marvinkreis/${pkgname%-git}"
license=("MIT")
depends=("rofi" "json-c")
makedepends=("git")
provides=("rofi-json-menu")
replaces=("rofi-prompt")
source=("git+https://github.com/marvinkreis/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    git submodule init
    git submodule update
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    autoreconf --install
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
