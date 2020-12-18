# Maintainer: Anthony Vitacco <breaker1@protonmail.com>
pkgname=gummi-git
_pkgname=gummi
pkgver=1048.a538d9b
pkgrel=1
pkgdesc="Gummi LaTeX Editor git version"
arch=("x86_64" "i686")
url="https://www.gummi.app/"
license=("MIT")
makedepends=(git intltool)
conflicts=(gummi)
depends=(gtk3 poppler-glib gtkspell3 texlive-core gtksourceview3)
source=("https://github.com/alexandervdm/gummi.git")
sha256sums=("SKIP")

pkgver() {
    cd "${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

