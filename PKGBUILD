# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>
# Contributor: Cyril Levis <pkgbuilds AT levis DOT name>
# Contributor: < eti {at} eti {dot} tf >
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-gruvbox-git
_pkgname=arc-gruvbox-theme
_pkgauthor=cyrinux
pkgver=r2.868b0e3
pkgrel=7
pkgdesc="A flat, grey gruvboxed theme with transparent elements for GTK 3, GTK 2 and gnome-shell. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('gtk-theme-arc-grey-gruvboxed')
provides=('gtk-theme-arc-grey-gruvboxed')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
