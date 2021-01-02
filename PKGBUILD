# Maintainer: Marvin Kreis <MarvinKreis@web.de>

pkgname=rofi-json-dict-git
pkgver=0.1.1.r0.g834015e
pkgrel=1
pkgdesc="A plugin to use rofi as a dictionary"
arch=("x86_64")
url="https://github.com/marvinkreis/${pkgname%-git}"
license=("MIT")
depends=("rofi" "json-c")
makedepends=("git" "cmake")
provides=("rofi-json-dict")
replaces=("rofi-dict")
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
