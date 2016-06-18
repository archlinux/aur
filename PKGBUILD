# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=1.7
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('cpio' 'desktop-file-utils' 'python' 'rpm-org')
makedepends=('bash-completion')
checkdepends=('python-pytest')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('3741c0c8345da4f3c633328fa7b35c9c')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	make COMPILE_PYC=1
}

# Tests need a non-empty RPM database on the system
# It may be created using "rpm --initdb"
#check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install

	install -Dp -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
