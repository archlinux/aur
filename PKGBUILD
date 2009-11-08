# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: kritoke <kritoke@nospam.gmail.com>

pkgname=ruby-glib2
pkgver=0.19.3
pkgrel=1
pkgdesc="Ruby Glib2 bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('GPL')
depends=('ruby' 'glib2')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gtk2-$pkgver.tar.gz)
md5sums=('1c0fdd888bf8ee1c49dc9b516a6e6d88')

build() {
  cd "$srcdir/ruby-gtk2-$pkgver"
  ruby extconf.rb glib || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  mv $pkgdir/usr/lib/pkgconfig $pkgdir/usr/lib/pkgconfig.orig
  install -d $pkgdir/usr/lib/pkgconfig
  mv $pkgdir/usr/lib/pkgconfig.orig  $pkgdir/usr/lib/pkgconfig/$pkgname.pc
}
