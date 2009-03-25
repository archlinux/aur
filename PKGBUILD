# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl
pkgver=0.9.8k
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('i686' 'x86_64')
url='http://www.openssl.org'
license=('custom:BSD')
depends=('zlib' 'perl')
optdepends=('ca-certificates')
options=('!makeflags')
# patch from http://www.linuxfromscratch.org/patches/blfs/svn/
source=("http://www.openssl.org/source/${pkgname}-${pkgver}.tar.gz" \
        'openssl-0.9.8j-fix_manpages-1.patch')
md5sums=('e555c6d58d276aec7fdc53363e338ab3'
         '04a6a88c2ee4badd4f8649792b73eaf3')

build() {
	cd $srcdir/$pkgname-$pkgver

	patch -p1 -i $srcdir/openssl-0.9.8j-fix_manpages-1.patch
	./config --prefix=/usr --openssldir=/etc/ssl shared zlib -Wa,--noexecstack

	make
	make test
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man install

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
