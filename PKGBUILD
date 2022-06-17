# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Petrenko Alexey <alexey-p at uralweb dot ru>

pkgname=perl-lwp-protocol-socks
pkgver=1.7
pkgrel=1
pkgdesc='Adds support for the socks protocol and proxy facility'
url='http://search.cpan.org/~scr/LWP-Protocol-socks-1.3/'
depends=('perl-libwww' 'perl-io-socket-ssl' 'perl-io-socket-socks' 'perl-lwp-protocol-https')
arch=('any')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/S/SC/SCR/LWP-Protocol-socks-$pkgver.tar.gz)
md5sums=('1f2031d0838d4c04babfb85f767d9ae0')

build() {
  cd  "$srcdir/LWP-Protocol-socks-$pkgver"

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

check() {
  cd  "$srcdir/LWP-Protocol-socks-$pkgver"

  make test
}

package() {
  cd  "$srcdir/LWP-Protocol-socks-$pkgver"

  make DESTDIR="$pkgdir"/ install

  # Removing unnecessary stuff
  find "$pkgdir" -type f -name 'perllocal.pod' -delete;
  find "$pkgdir" -type f -name '.packlist' -delete;
}
