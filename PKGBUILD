# $Id: PKGBUILD 83024 2013-01-26 16:46:15Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Eric Bélanger
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgbase=ruby-gtk3
pkgname=('ruby-atk' 'ruby-gdkpixbuf2' 'ruby-gio2' 'ruby-glib2' 'ruby-gtk3' 'ruby-pango' 'ruby-gdk3')
pkgver=1.2.0
pkgrel=1
arch=('x86_64' 'i686')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
makedepends=('ruby-pkgconfig' 'ruby-cairo' 'gtk3')
source=("http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk3-$pkgver.tar.gz")
sha256sums=('b080e173040501be359ad305617f78786b0ff46c0ae311e35852dc57c35b39a9')

build() {
	cd "$srcdir/ruby-gtk3-$pkgver"
	LANG="en_US.UTF-8" ruby extconf.rb \
    atk gdk_pixbuf2 gio2 glib2 gtk3 pango gdk3 \
    --topdir="$pkgdir" --vendor
	make
}

package_ruby-atk() {
  pkgdesc="Ruby bindings for atk"
  depends=("ruby-glib2=$pkgver" 'atk')

	cd "$srcdir/ruby-gtk3-$pkgver/atk"
	make DESTDIR="$pkgdir" install
}

package_ruby-gdkpixbuf2() {
  pkgdesc="Ruby bindings for gdkpixbuf2"
  depends=("ruby-glib2=$pkgver" 'gdk-pixbuf2')

	cd "$srcdir/ruby-gtk3-$pkgver/gdk_pixbuf2"
	make DESTDIR="$pkgdir" install
}

package_ruby-gio2() {
  pkgdesc="Ruby bindings for gio2"
  depends=("ruby-glib2=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gio2"
	make DESTDIR="$pkgdir" install
}

package_ruby-glib2() {
  pkgdesc="Ruby bindings for glib2"
  depends=('glib2' 'ruby')

	cd "$srcdir/ruby-gtk3-$pkgver/glib2"
	make DESTDIR="$pkgdir" install
}

package_ruby-gtk3() {
  pkgdesc="Ruby bindings for gtk3"
  depends=('gtk3' "ruby-glib2=$pkgver" "ruby-pango=$pkgver" "ruby-atk=$pkgver"
           "ruby-gdkpixbuf2=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gtk3"
	make DESTDIR="$pkgdir" install
}

package_ruby-pango() {
  pkgdesc="Ruby bindings for pango"
  depends=("ruby-glib2=$pkgver" 'ruby-cairo' 'pango')

	cd "$srcdir/ruby-gtk3-$pkgver/pango"
	make DESTDIR="$pkgdir" install
}

package_ruby-gdk3() {
  pkgdesc="Ruby bindings for gdk3"
  depends=("ruby-gtk3=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gdk3"
	make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
