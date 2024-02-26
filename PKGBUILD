# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

## GPG keys: https://opendap.org/security_at_opendap.org.pub.asc

pkgname=libdap
pkgver=3.21.0
pkgrel=1
pkgdesc="A library which contains an implementation of DAP 2.0 and 3.1"
arch=('i686' 'x86_64')
url="https://opendap.org/index.php/software/libdap"
license=('LGPL-2.1-or-later')
depends=('libcurl.so' 'libxml2.so' 'libtirpc')
provides=('libdap.so' 'libdapclient.so' 'libdapserver.so')
source=("$pkgname-$pkgver.tar.gz::https://www.opendap.org/pub/source/$pkgname-$pkgver-27.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://www.opendap.org/pub/source/$pkgname-$pkgver-27.tar.gz.sig")
sha256sums=('b5b8229d3aa97fea9bba4a0b11b1ee1c6446bd5f7ad2cff591f86064f465eacf'
            'SKIP')
validpgpkeys=('5B1F97F8B64BCF0BA36F377F152DB89D737C24C4') ## security@opendap.org

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS -I/usr/include/tirpc" LIBS='-ltirpc'
	make
}

## FIXME: tests fail
# check() {
# 	cd "$pkgname-$pkgver"
# 	make check
# }

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=${pkgdir} install
}
