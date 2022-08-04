# Maintainer: Marvin Kreis <MarvinKreis@web.de>

pkgname=rofi-file-browser-extended-git
pkgver=1.3.1.r5.g44e5f0a
pkgrel=1
pkgdesc="Use rofi to quickly open files"
arch=("x86_64")
url="https://github.com/marvinkreis/${pkgname%-git}"
license=("MIT")
depends=("rofi")
makedepends=("git" "cmake")
provides=("rofi-file-browser-extended")
replaces=("rofi-file_browser-extended")
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
