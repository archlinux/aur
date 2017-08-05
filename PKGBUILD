# Contributor: Alan Brault <extrarius.aur@incruentatus.net>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=yum-utils
pkgver=1.1.31
pkgrel=6
pkgdesc="A collection of utilities and plugins extending and supplementing yum in different ways"
arch=('any')
license=('GPL2')
url="http://yum.baseurl.org/wiki/YumUtils"
depends=('yum')
makedepends=('intltool')
source=("http://yum.baseurl.org/download/$pkgname/$pkgname-$pkgver.tar.gz"
        "http://pkgs.fedoraproject.org/rpms/$pkgname/raw/master/f/$pkgname-HEAD.patch")
md5sums=('b2859b89321b98f2581243536e1b4993'
         '139f73ae07023350d5624a18dfee892c')

prepare() {
	cd "$pkgname-$pkgver"

	# Patch up to Fedora current
	patch -p1 < "$srcdir/$pkgname-HEAD.patch"

	find -type f | xargs sed -e 's|#! */usr/bin/python|&2|' -i
	sed -e 's|/usr/sbin/|/usr/bin/|g' -i Makefile
}

package() {
	cd "$pkgname-$pkgver"
	make BASHCOMPPATH="$pkgdir/"usr/share/bash-completion/completions/ \
	     PYTHON=python2 DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
