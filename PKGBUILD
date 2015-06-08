pkgname=lwatch
pkgver=0.6.2
pkgrel=1
pkgdesc="Colourizing a system logs for easier reading."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('pcre')
backup=("etc/$pkgname.conf")
source=("http://download.sourceforge.net/project/$pkgname/current/$pkgname-$pkgver.tar.bz2"{,.asc})
md5sums=('8cad9f315a7116d98d6640573b2569b0'
         'SKIP')
validpgpkeys=('C1FABEE40A628709CCFB7D2C964D005C0CA7686C') # Artur R. Czechowski <arturcz@hell.pl>

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr        \
	            --localstatedir=/var \
	            --sysconfdir=/etc
	make

	# Manually adjusts paths in man pages without needing docbook-to-man
	sed -i 's|//\(var\|etc\)|/\1|' doc/$pkgname.{1,conf.5}
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
