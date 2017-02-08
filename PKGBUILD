# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_pkgname=redshift
pkgname=${_pkgname}-light
pkgver=1.11
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings, without redshift-gtk GUI."
arch=('i686' 'x86_64')
url="http://jonls.dk/redshift"
license=('GPL3')
depends=('geoclue2' 'libdrm' 'libxxf86vm')
makedepends=('intltool' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/jonls/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('10e350f93951c0521dd6f103d67a485972c307214f036e009acea2978fe4f359')

build() {
    cd ${_pkgname}-${pkgver}

    ./configure \
        --prefix=/usr \
        --enable-drm \
        --enable-randr \
        --enable-vidmode \
        --enable-geoclue2 \
        --disable-gui \
        --with-systemduserunitdir=/usr/lib/systemd/user
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/lib/systemd/user/redshift-gtk.service
}
