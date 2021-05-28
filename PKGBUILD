# Maintainer: taotieren <admin@taotieren.com>

pkgname=extundelete
pkgver=0.2.4
pkgrel=1
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('GPLv2')
pkgdesc="extundelete is a utility that can recover deleted files from an ext3 or ext4 partition."
depends=('glibc' 'e2fsprogs')
provides=()
conflicts=(${pkgname})
#replaces=(${pkgname})
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
groups=()
source=("${pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
    "${pkgname}-${pkgver}-e2fsprogs.patch::https://sourceforge.net/p/${pkgname}/tickets/5/attachment/${pkgname}-${pkgver}-e2fsprogs.patch.txt")
sha256sums=('a1f9dd61247056d36401ce5d6785e74d08a184340eebd3865c345ddaa93f19f4'
            '4304dc55d3881ed66017276e0553d7c0bde3384f62b3a9f50a34547ddcad04a8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 < "${srcdir}/${pkgname}-${pkgver}-e2fsprogs.patch"

    ./configure
    make
}

package () {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
