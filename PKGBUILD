# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.7
pkgrel=6
pkgdesc="A C program flow analyzer"
arch=('x86_64')
url="https://www.gnu.org/software/cflow/"
license=('GPL-3.0-or-later')
depends=('glibc')
source=(
    "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
    # https://src.fedoraproject.org/rpms/cflow/raw/rawhide/f/cflow-1.7-decl.patch
    "cflow-1.7-decl.patch"
)
b2sums=('0d015f66a1cdeb5119d09c6a81231414362bb5a130d744a4532f3eac7de54f05472716afdcf244d413f510f2f955655654192ef467c56588a09a69b064bd43b7'
        'SKIP'
        '6e437f391ff3dbf2dacce2b9982f481b75295482882a438170ab6b90d9d1091ea53f010d61dba8657d2555b1431ab112f484fa5d016d8ffa394e59c64788b039')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input=../cflow-1.7-decl.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
	CFLAGS="-Wno-incompatible-pointer-types" \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info \
	--sysconfdir=/etc

    make dist-all
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
