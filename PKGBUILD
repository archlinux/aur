# $Id$
# Description: modutils
# Maintainer: Henry Jensen <hjensen@delilinux.de>

pkgdesc="modutils"
pkgname=modutils
pkgver=2.4.27
pkgrel=2
groups=('core')
depends=('glibc')
makedepends=("gcc>=4" "binutils" "bison" "flex")
arch=("i686" "x86_64")
license=("GPL")
conflicts=("module-init-tools")
url="http://www.kernel.org/"

source=("http://www.kernel.org/pub/linux/utils/kernel/modutils/v2.4/$pkgname-$pkgver.tar.gz" "http://englanders.cc/pub/linux/patches/notmine/modutils-gcc40.patch")
md5sums=('51aa91627a2803df5873beae59d2f785' '05191fe3364ad37c4519b249c97ac76d')

build() {
	cd ${srcdir}/$pkgname-$pkgver
	patch -p1 < ../modutils-gcc40.patch
	./configure --prefix=/ --enable-zlib
	make
	make DESTDIR="${pkgdir}" install
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mv "${pkgdir}/man" "${pkgdir}/usr/share"
	}
