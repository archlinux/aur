# Maintainer: Marvin Kreis <MarvinKreis@web.de>

pkgname=rofi-json-dict-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A plugin to use rofi as a dictionary"
arch=("x86_64")
url="https://github.com/marvinkreis/${pkgname%-git}"
license=("MIT")
depends=("rofi")
makedepends=("git")
provides=("rofi-json-dict")
replaces=("rofi-dict")
source=("git+https://github.com/marvinkreis/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags
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
