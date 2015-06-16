# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-javascript-spidermonkey
pkgver=0.21
pkgrel=1
pkgdesc="Perl interface to the JavaScript Engine"
arch=('i686' 'x86_64')
url="http://search.mcpan.org/~tbusch/JavaScript-SpiderMonkey/SpiderMonkey.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'spidermonkey-1.7')
options=(!emptydirs)
source=(http://search.mcpan.org/CPAN/authors/id/T/TB/TBUSCH/JavaScript-SpiderMonkey-$pkgver.tar.gz)
md5sums=('404a0c6216c762a1b693056850c8cea5')

package() {
  cd "$srcdir/JavaScript-SpiderMonkey-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor --JS_LIB_DIR=/usr/include/spidermonkey-1.7/ --JS_LIB_NAME=js || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
