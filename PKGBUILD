# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Eric Bélanger
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgbase=ruby-gtk3
pkgname=('ruby-gtk3' 'ruby-gdk3')
depends=('ruby-atk' 'ruby-gdkpixbuf2' 'ruby-gio2' 'ruby-glib2' 'ruby-pango')
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

package_ruby-gtk3() {
  pkgdesc="Ruby bindings for gtk3"
  depends=('gtk3' "ruby-glib2=$pkgver" "ruby-pango=$pkgver" "ruby-atk=$pkgver"
           "ruby-gdkpixbuf2=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gtk3"
	make DESTDIR="$pkgdir" install
}

package_ruby-gdk3() {
  pkgdesc="Ruby bindings for gdk3"
  depends=('ruby' 'gtk3')

	cd "$srcdir/ruby-gtk3-$pkgver/gdk3"
	make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
