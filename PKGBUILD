# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
#
_pkgname="parted"
pkgname="libparted"
pkgver=3.2
pkgrel=3
pkgdesc="A version with DEBUG defined in its compilation, to provide some necessary functions for other applications."
arch=('x86_64')
url="http://www.gnu.org/software/parted/parted.html"
license=('GPL3')
conflicts=('parted' 'parted-git')
provides=("${_pkgname}")
depends=('device-mapper' 'libutil-linux')
makedepends=('pkg-config')
validpgpkeys=('1B49F933916A37A3F45A1812015F4DD4A70FB705') # Phillip Susi <psusi@ubuntu.com>
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        'parted-735669-fat16-crash-v1.patch'
        'include.patch'
)
sha256sums=('858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4'
            'SKIP'
            '3cbf31765b1653609a4c95687b91e34dd57ad3498d5d02019c966bd46d25d100'
            '789d6ef8fcff389f9f74bd9e377aff9949ab5b317a80bd38cec39510bd40cef6'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/parted-735669-fat16-crash-v1.patch"
    patch -Np1 -i "${srcdir}/include.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --disable-rpath
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
