# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname='perl-growl-gntp'
pkgver='0.20'
pkgrel='1'
pkgdesc="Perl implementation of GNTP Protocol (Client Part)"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl-extutils-makemaker' 'perl-data-uuid' 'perl-crypt-cbc' 'perl-digest-sha' 'perl-module-build' 'perl>=5.8.1')
makedepends=('perl-libwww')
checkdepends=('perl-test-fatal' 'perl-test-warn')
conflicts=('perl-net-http=6.04' 'perl-net-http=6.05')
url='http://search.cpan.org/~mattn/Growl-GNTP-0.20/lib/Growl/GNTP.pm'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATTN/Growl-GNTP-0.20.tar.gz')
sha256sums=('b1c9795b72c750ca6bb69cfa7e50e78e429a8e1972d7cb9ed7ee1ec769311d94')
_distdir="Growl-GNTP-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

