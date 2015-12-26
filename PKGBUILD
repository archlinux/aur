# Contributor: Alan Brault <extrarius.aur@incruentatus.net>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=yum-utils
pkgver=1.1.31
_fedora=f23
pkgrel=5
pkgdesc="A collection of utilities and plugins extending and supplementing yum in different ways"
arch=('any')
license=('GPLv2')
url="http://yum.baseurl.org/wiki/YumUtils"
depends=('yum')
makedepends=('intltool')
source=("http://yum.baseurl.org/download/$pkgname/$pkgname-$pkgver.tar.gz"
        "http://pkgs.fedoraproject.org/cgit/$pkgname.git/plain/$pkgname-HEAD.patch?h=$_fedora")
md5sums=('b2859b89321b98f2581243536e1b4993'
         '139f73ae07023350d5624a18dfee892c')

prepare() {
	cd "$pkgname-$pkgver"

	# Patch up to Fedora current
	patch -p1 < "$srcdir/$pkgname-HEAD.patch?h=$_fedora"

	find -type f | xargs sed -i 's|#! */usr/bin/python|&2|'
	sed -e 's|/usr/sbin/|/usr/bin/|g' -i Makefile
}

package() {
	cd "$pkgname-$pkgver"
	make PYTHON=python2 DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
