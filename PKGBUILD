# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-notify
pkgver=0.05
pkgrel=12
pkgdesc="Perl interface to libnotify"
arch=('i686' 'x86_64')
url="http://search.cpan.org/perldoc?Gtk2::Notify"
license=('LGPL')
depends=('gtk2-perl' 'libnotify' 'perl-extutils-pkgconfig' 
'perl-extutils-depends')
source=(http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Gtk2-Notify-$pkgver.tar.gz libnotify.patch)
md5sums=('071144ad4a5670b8b2451baf358c4a88' '39d193a18df5d75ddc79d4c2333c4760')
sha1sums=('b0223dd5a85358c9b92ebc99040201e640612348' '55a8c591a4d3c3fb1d23a2c949d52e204f04350f')

build() {
    cd "$srcdir"
    patch -p 0 <libnotify.patch
    cd "$srcdir/Gtk2-Notify-$pkgver"
    perl Makefile.PL INSTALLDIRS=vendor
    make || return 1
}
package() {
    cd "$srcdir/Gtk2-Notify-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
