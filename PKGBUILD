# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-https-any'
pkgver='0.12'
pkgrel='1'
pkgdesc="Simple HTTPS class using whichever underlying SSL module is available"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-tie-ixhash' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/Net-HTTPS-Any'
source=('http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/Net-HTTPS-Any-0.12.tar.gz' 'google.patch')
md5sums=('7aeffff7ebda0fb8a85afb01bf05bd49' 'bf21e80f7730cb6f23f943be4306e11c')
sha512sums=('e14b0b39df0cc1f6f14a56cfe7ed536c372d2bdc6ab66bffbd1c28ef33d8854919f19dddee32cb3a5239507653379c982022f32bc28a50071c1cb691b9d77be9' '9c8842cd9543e99aad562f7889d578cc3864a813dc72ca510824cd519c9088664aed36a05fbe549271f15282f8ae41163e02abe95e14e0ef48ac9b990af7cae0')
_distdir="Net-HTTPS-Any-0.12"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    patch -p1 -i "${srcdir}/google.patch"
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
