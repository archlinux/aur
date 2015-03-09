# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
#
# This is based on AUR packages socat2. The original maintainer is:
# Maintainer: Stefan Haller <haliner@googlemail.com>
#
# The original PKGBUILD for socat in the official repository was written by:
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

_pkgname=socat2
pkgname=${_pkgname}-git
pkgver=2.0.0.b6.0.gc22863e
pkgrel=4
pkgdesc='Multipurpose relay (development version)'
url='http://www.dest-unreach.org/socat/socat-version2.html'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('readline' 'openssl')
makedepends=('yodl')
source=("$_pkgname"::"git+http://repo.or.cz/socat.git#branch=socat2")
sha256sums=('SKIP')
provides=('socat')
conflicts=('socat')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/^tag-//;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    msg "Running autoconf..."
    autoconf

    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \

    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
}
