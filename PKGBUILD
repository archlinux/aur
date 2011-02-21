# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-pango
pkgver=0.90.7
pkgrel=2
pkgdesc="Ruby bindings for pango."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-glib2' 'ruby-cairo')
makedepends=('ruby-glib2' 'pango' 'ruby-pkgconfig' 'ruby-cairo')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz
	'mkmf-gnome2.patch')
md5sums=('82ebea3ebb6fa51ffc5ec631b31d519a'
	 '93dac3212aa8fccfc83b2cd518750cf7')
build() {
	cd "$srcdir/ruby-gtk2-$pkgver"

	# Apply ruby-cairo fixes
        patch -Np1 -i ../mkmf-gnome2.patch glib2/lib/mkmf-gnome2.rb	

	ruby extconf.rb pango --topdir=$pkgdir
	make
}
package() {
	cd "$srcdir/ruby-gtk2-$pkgver"
	make DESTDIR="$pkgdir" install
}
