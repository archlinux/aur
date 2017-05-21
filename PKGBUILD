# Maintainer: Mitchell Hentges <mitch@fuzzlesoft.ca>

_pkgname=grestful
pkgname=${_pkgname}-git
pkgver=20170119.0b56614
pkgrel=1
pkgdesc="A simple RESTful API client written in GTK 3."
url="https://gitlab.com/Gert-dev/grestful"
arch=("i686" "x86_64")
license=("MPL")
depends=("curl")
makedepends=("dub" "dmd" "git" "gtk3" "gtksourceview3" )
source=("${_pkgname}::git+https://gitlab.com/Gert-dev/grestful.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${_pkgname}"
    dub build --build=release
}

package() {
    builddir="${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${builddir}/grestful" "${pkgdir}/usr/bin/grestful"
    mkdir -p "${pkgdir}/usr/share/grestful"
    cp -R "${builddir}/public/design" "${pkgdir}/usr/share/grestful/"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -R "${builddir}/public/grestful.desktop" "${pkgdir}/usr/share/applications/"
}
