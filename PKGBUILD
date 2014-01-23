# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Eric Bélanger
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgbase=ruby-gtk3
pkgver=2.1.0
pkgrel=2
pkgname=('ruby-gtk3' 'ruby-gdk3')
depends=("ruby-atk=$pkgver" "ruby-gdkpixbuf2=$pkgver" "ruby-glib2=$pkgver" "ruby-pango=$pkgver")
arch=('x86_64' 'i686')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
makedepends=('ruby-pkgconfig' 'ruby-cairo' 'gtk3')
source=("http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk3-$pkgver.tar.gz")
sha256sums=('436844cc9ab3bf5e5a3027e3276fc69ff9cae5cff88bc60179c416050d5e753d')

prepare() {
	cd "$srcdir/ruby-gtk3-$pkgver"

	LANG="en_US.UTF-8" ruby extconf.rb gtk3 gdk3 --vendor
}

build() {
	cd "$srcdir/ruby-gtk3-$pkgver"
	make
}

package_ruby-gtk3() {
  pkgdesc='Ruby bindings for gtk3'
  depends=('gtk3' "ruby-glib2=$pkgver" "ruby-pango=$pkgver" "ruby-atk=$pkgver"
           "ruby-gdkpixbuf2=$pkgver" "ruby-gdk3=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gtk3"
  mkdir -p "$pkgdir/usr/lib/ruby/vendor_ruby/2.0.0/$CARCH-linux"
	make DESTDIR="$pkgdir/" install -j1
}

package_ruby-gdk3() {
  pkgdesc='Ruby bindings for gdk3'
  depends=('ruby' 'gtk3')

	cd "$srcdir/ruby-gtk3-$pkgver/gdk3"
  mkdir -p "$pkgdir/usr/lib/ruby/vendor_ruby/2.0.0/$CARCH-linux"
	make DESTDIR="$pkgdir/" install -j1
}

# vim:set ts=2 sw=2 et:
