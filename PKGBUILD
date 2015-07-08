# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-notify
_cpanname=Gtk2-Notify
pkgver=0.05
pkgrel=12
pkgdesc="Perl interface to libnotify"
arch=('i686' 'x86_64')
url="http://search.cpan.org/perldoc?Gtk2::Notify"
license=('LGPL')
depends=('gtk2-perl' 'libnotify')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/$_cpanname-$pkgver.tar.gz"
	"libnotify.patch")
md5sums=('071144ad4a5670b8b2451baf358c4a88'
         'c54d841861c9adfaa77b80bdf9cb0f98')

prepare() {
  cd $_cpanname-$pkgver
  patch -Np2 -b -z .orig <../libnotify.patch
}
build() {
  cd $_cpanname-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $_cpanname-$pkgver
  make DESTDIR="$pkgdir" install
}
