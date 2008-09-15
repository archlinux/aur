# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=0.9.8i
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
groups=('base')
depends=('glibc')
options=('!makeflags')
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz" \
        'http://www.linuxfromscratch.org/patches/blfs/svn/openssl-0.9.8g-fix_manpages-1.patch')
md5sums=('561e00f18821c74b2b86c8c7786f9d8b'
         '04a6a88c2ee4badd4f8649792b73eaf3')

build() {
	cd $startdir/src/$pkgname-$pkgver

	patch -p1 -i ../openssl-0.9.8g-fix_manpages-1.patch  || return 1
	./config --prefix=/usr --openssldir=/etc/ssl shared

	make || return 1
	make INSTALL_PREFIX=$startdir/pkg MANDIR=/usr/share/man install

	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
