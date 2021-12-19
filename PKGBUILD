# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=faba-mono-icons-git
_pkgname=${pkgname%-git}
pkgver=r106.2006c52
pkgrel=1
pkgdesc="Supplementary theme to Faba Icon Theme - consists only of monochrome panel icons"
arch=('any')
url="https://snwh.org/moka"
license=('GPL3')
depends=('faba-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(!strip)
source=("git+https://github.com/snwh/${_pkgname}.git")
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" make install
}
