# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32
#
# CAUTION: If your DNS-Provider redirects you on non-existing domain-names
# (to his request-failed-page) then the t/listidentifiers.t-test will fail:
# > t/listidentifiers.t ...... Dubious, test returned 1 (wstat 256, 0x100)
# > Failed 1/3 subtests
# This can be checked via "ping domain.invalid". If you get an answer, you were redirected.
# German Telekom does this insanity:
# > wget domain.invalid
# ...
# > Location: http://navigationshilfe1.t-online.de/dnserror?url=domain.invalid/ [following]
# In this case disable the tests below or fix your DNS-Server.
#
# cpan2aur needs perl-cpanplus-dist-build to generate this PKGBUILD
# see https://bugs.archlinux.org/task/46900.
#

pkgname='perl-http-oai'
pkgver='4.13'
pkgrel='1'
pkgdesc="Perl/CPAN Module HTTP::OAI: API for the OAI-PMH"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-module-build>=0.4229' 'perl-uri' 'perl-xml-libxml>=1.60' 'perl-xml-namespacesupport' 'perl-xml-sax' 'perl-xml-sax-base>=1.04' 'perl-libwww')
makedepends=()
checkdepends=('perl-test-deep>=0.112' 'perl-test-lwp-useragent' 'perl-test-pod')
url='https://metacpan.org/release/HTTP-OAI'
source=("http://search.cpan.org/CPAN/authors/id/H/HO/HOCHSTEN/HTTP-OAI-$pkgver.tar.gz")
md5sums=('2e6cd8f750884a50741acbac20007b9e')
sha512sums=('99dfd3204f44d4c15a4e46c141ece8077c953a5a912dbab98ccc95b0a85e86ed6f7bd880ffa73deac4ebb3e6b2e359acad92f19ab08d225e470bd7f1f8f3d353')
_distdir="HTTP-OAI-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
