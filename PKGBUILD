# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=libumlib0
pkgver=0.8.2
pkgrel=1
pkgdesc="Library with common functions used by every UMView module."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("http://http.debian.net/debian/pool/main/u/umview/umview_0.8.2.orig.tar.gz"
        "${pkgname}.install"
        "${pkgname}.diff"
        "http://ftp.us.debian.org/debian/pool/main/u/umview/libumlib0_0.8.2-1.1_i386.deb")
md5sums=("ac6d6baeb5700943ecf5021d980ceb7d"
         "b4165e6142a92d65c8e14479486decc4"
         "c3c17eafbb532433d49e37f9cfabbed7"
         "7fb63081024db1b749e24cb19416ff66")

prepare() {
   cd $srcdir
   patch -i ${pkgname}.diff umview-${pkgver}/Makefile.am
}

build(){
   cd "$srcdir/umview-${pkgver}"
   autoreconf -i
   ./configure --prefix="${pkgdir}/usr" --disable-static
   make
}

package() {
   mkdir -p ${pkgdir}/usr/share
   tar -xf data.tar.xz
   cp -r usr/share ${pkgdir}/usr/
   cd "$srcdir/umview-${pkgver}"
   make install &> /dev/null
}
