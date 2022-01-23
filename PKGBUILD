# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=lwatch
pkgver=0.6.2
pkgrel=2
pkgdesc="Colourizing a system logs for easier reading."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('pcre')
backup=("etc/$pkgname.conf")
source=("https://download.sourceforge.net/project/$pkgname/current/$pkgname-$pkgver.tar.bz2")
#source=("https://download.sourceforge.net/project/$pkgname/current/$pkgname-$pkgver.tar.bz2"{,.asc})
md5sums=('8cad9f315a7116d98d6640573b2569b0')

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
