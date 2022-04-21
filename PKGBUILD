# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-digest-sha'
pkgver='6.02'
pkgrel='1'
pkgdesc="Perl extension for SHA-1/224/256/384/512"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/pod/Digest::SHA'
source=("https://cpan.metacpan.org/authors/id/M/MS/MSHELOR/Digest-SHA-$pkgver.tar.gz")
md5sums=('e22f92fa4e2d7ec9b1168538b307d31c')
sha512sums=('405da790a409e22fa266d0915c26223ed64c1bed96ce78d83931bab7b8a1b27deefcb05e366e5088b7aa722530f0d70f03d83a85b98637e477930aad7212a806')
_distdir="Digest-SHA-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
