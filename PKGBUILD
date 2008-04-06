# $Id: PKGBUILD,v 1.40 2007/11/16 00:02:36 daniel Exp $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=openssl
pkgver=0.9.8g
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
groups=('base')
depends=('glibc')
options=('!makeflags')
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz" \
        'http://www.linuxfromscratch.org/patches/blfs/svn/openssl-0.9.8e-fix_manpages-1.patch')
md5sums=('acf70a16359bf3658bdfb74bda1c4419' '04a6a88c2ee4badd4f8649792b73eaf3')

build() {
	cd $startdir/src/$pkgname-$pkgver

	patch -p1 -i ../openssl-0.9.8e-fix_manpages-1.patch  || return 1
	./config --prefix=/usr --openssldir=/etc/ssl shared

	make || return 1
	make INSTALL_PREFIX=$startdir/pkg MANDIR=/usr/man install

	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
