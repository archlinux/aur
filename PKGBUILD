# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Eric Bélanger
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgbase=ruby-gtk3
pkgname=('ruby-gtk3' 'ruby-gdk3')
depends=('ruby-atk' 'ruby-gdkpixbuf2' 'ruby-glib2' 'ruby-pango')
pkgver=1.2.2
pkgrel=2
arch=('x86_64' 'i686')
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPL')
makedepends=('ruby-pkgconfig' 'ruby-cairo' 'gtk3')
source=("http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk3-$pkgver.tar.gz"
        '0001-backport-fix-for-syntax-error-https-github.com-ruby.patch')
sha256sums=('1dd73c4aa184199f373edad589b715b68da8eb43ae6bdae360e0aa62189a681d'
            '0df3571688a18048fac9211df1bf21effd4120e568b34e523fe50a7a63e3e3d6')

build() {
	cd "$srcdir/ruby-gtk3-$pkgver"

  #patch -Np1 -i \
  #  "$srcdir/0001-backport-fix-for-syntax-error-https-github.com-ruby.patch"
	LANG="en_US.UTF-8" ruby extconf.rb gtk3 gdk3 --vendor
	make
}

package_ruby-gtk3() {
  pkgdesc='Ruby bindings for gtk3'
  depends=('gtk3' "ruby-glib2=$pkgver" "ruby-pango=$pkgver" "ruby-atk=$pkgver"
           "ruby-gdkpixbuf2=$pkgver" "ruby-gdk3=$pkgver")

	cd "$srcdir/ruby-gtk3-$pkgver/gtk3"
	make DESTDIR="$pkgdir/" install
}

package_ruby-gdk3() {
  pkgdesc='Ruby bindings for gdk3'
  depends=('ruby' 'gtk3')

	cd "$srcdir/ruby-gtk3-$pkgver/gdk3"
  [ $CARCH == 'i686' ] && mkdir -p /usr/lib/ruby/vendor_ruby/2.0.0/i686-linux
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
