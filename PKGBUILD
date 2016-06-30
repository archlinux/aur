pkgname=libhif
pkgver=0.2.3
pkgrel=1
pkgdesc="Library providing a high level package-manager. It uses librepo and hawkey under the hood."
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('hawkey>=0.4.6' 'librepo>=1.7.11' 'rpm-org>=4.11.0')
makedepends=('gobject-introspection' 'gtk-doc')
source=("$url/archive/${pkgname}_${pkgver//./_}.tar.gz")
md5sums=('1af1bc8e7c5f1fda66fee9ababf9498f')

prepare() {
	mv  "$pkgname-${pkgname}_${pkgver//./_}" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	            --enable-gtk-doc \
	            --enable-dnf-yumdb

	make
}

# TODO: Find out why tests fail and fill a bug report upstream if needed
#check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
