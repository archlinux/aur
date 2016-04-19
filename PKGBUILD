# Maintainer: James An <james@jamesan.ca>
# Contributor: Brent S. <bts[at]square-r00t[dot]net>
# Past maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Juergen Hoetzel <jason@archlinux.org>

pkgname=kismet-plugins-restricted
_pkgname=kismet
pkgver=2016_01_R1
_realver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Restricted plugins (AutoWEP and PTW attack) for Kismet"
arch=('i686' 'x86_64')
url="http://www.kismetwireless.net/"
license=('GPL')
conflicts=('kismet-ptw' 'kismet-autowep')
provides=('kismet-ptw' 'kismet-autowep')
depends=('kismet')
source=("http://www.kismetwireless.net/code/${_pkgname}-${_realver}.tar.xz")
md5sums=('3af777cf90a37fd698c5d8d849a2a7b1')
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

build() {
    cd "${srcdir}/${_pkgname}-${_realver}"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var
    make restricted-plugins
}

package() {
    cd "${srcdir}/${_pkgname}-${_realver}"

    make DESTDIR="${pkgdir}" restricted-plugins-install
}
