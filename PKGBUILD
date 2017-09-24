pkgname=perl-test-use-ok
_realname=Test-use-ok
pkgver=0.11
pkgrel=3
pkgdesc="Alternative to Test::More::use_ok"
arch=('any')
license=('perl')
url='http://search.cpan.org/~audreyt/Test-use-ok'
options=(!emptydirs)
depends=('perl>=5.8.9')
provides=('test-use-ok=0.11'
          'ok=0.11'
          'perl-ok=0.11'
          'Test::use::ok=0.11'
          'perl-test-use-ok=0.11'
          )
source=('http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Test-use-ok-0.11.tar.gz')
sha256sums=('014364cc2f0df651d8416ebb60451f18')

build() {
  cd "${_realname}-${pkgver}"
  # install module in vendor directories.
  ( export PERL_MM_USE_DEFAULT=1 \
           PERL5LIB="${srcdir}/${_realname}-${pkgver}" \
           PERL_AUTOINSTALL=--skipdeps \
           PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
           PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
           MODULEBUILDRC=/dev/null

    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${_realname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 \
           PERL5LIB="${srcdir}/${_realname}-${pkgver}"

    make test
  )
}

package() {
  cd "${_realname}-${pkgver}"
  make install

  find "${pkgdir}" -name '.packlist' -o -name 'perllocal.pod' -delete
}
