# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.8
pkgrel=1
pkgdesc="A C program flow analyzer"
arch=('x86_64')
url="https://www.gnu.org/software/cflow/"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
b2sums=('3df5bb269847b980ef6f766db4e6969c651b803046247bf202393324cf3a8eb876da9da48c1118c27144463a25a2a55cf98289fcda777849748b13b0e1d4a269'
        'SKIP')
validpgpkeys=('4BE4E62655488EB92ABB468F79FFD94BFCE230B1')

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
