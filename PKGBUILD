# Contributor: koneu
# Contributor: Thomas Dziedzic

pkgname=usermode
pkgver=1.114
pkgrel=1
pkgdesc="Allow configured programs to be run with superuser privileges by ordinary users"
arch=('i686' 'x86_64')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('glib2' 'libuser' 'pam')
makedepends=('intltool')
options=('!emptydirs')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('e7f58712b12175965b3a21522052863a061f3f1a888df3ffbe713b434f80254f')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr      \
	            --sbindir=/usr/bin \
	            --sysconfdir=/etc  \
	            --without-fexecve  \
	            --without-gtk
	make
}

package() {
	cd "$pkgname-$pkgver"

	make "DESTDIR=$pkgdir/" install

	chmod 04711 "$pkgdir"/usr/bin/userhelper
}

# vim: set ft=sh ts=4 sw=4 noet:
