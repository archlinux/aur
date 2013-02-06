# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Eric Bélanger
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgbase=ruby-gtk3
pkgname=('ruby-gtk3' 'ruby-gdk3')
depends=('ruby-atk' 'ruby-gdkpixbuf2' 'ruby-glib2' 'ruby-pango')
pkgver=1.2.1
pkgrel=2
arch=('x86_64' 'i686')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
makedepends=('ruby-pkgconfig' 'ruby-cairo' 'gtk3')
source=("http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk3-$pkgver.tar.gz")
sha256sums=('78c7dbfaebabefe0f5a3d96c779cc08ea949a354e3f7cd1ff797d850ded4168a')

build() {
	cd "$srcdir/ruby-gtk3-$pkgver"
	LANG="en_US.UTF-8" ruby extconf.rb gtk3 gdk3 --vendor
	make
}

package_ruby-gtk3() {
  pkgdesc='Ruby bindings for gtk3'
  depends=('gtk3' "ruby-glib2=$pkgver" "ruby-pango=$pkgver" "ruby-atk=$pkgver"
           "ruby-gdkpixbuf2=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gtk3"
	make DESTDIR="$pkgdir/" install
}

package_ruby-gdk3() {
  pkgdesc='Ruby bindings for gdk3'
  depends=('ruby' 'gtk3')

	cd "$srcdir/ruby-gtk3-$pkgver/gdk3"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
