#! /bin/sh
# Contributor: Yen Chi Hsuan <yan12125 at gmail dot com>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

_pkgname=purple-line
pkgname=${_pkgname}-git
pkgver=20150426
pkgrel=1
pkgdesc="Line plugin for pidgin (libpurple)"
arch=('x86_64' 'i686')
license=('custom')
url='http://altrepo.eu/git/purple-line.git/'
depends=('libpurple' 'thrift')
makedepends=('git' 'boost')
source=(
    "${_pkgname}"::"git+http://altrepo.eu/git/purple-line.git/"
    "line-protocol"::"git+http://altrepo.eu/git/line-protocol.git/"
)
sha256sums=("SKIP" "SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd ${srcdir}/${_pkgname}/
    ln -s ../line-protocol/line_main.thrift
    make
}

package() {
    cd ${srcdir}/${_pkgname}/libpurple/
    install -Dm755 libline.so "${pkgdir}/usr/lib/purple-2/libline.so"
}

