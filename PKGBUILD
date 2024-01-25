# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=OCBNET

pkgname='perl-css-sass'
pkgver='3.6.4'
pkgrel='1'
pkgdesc="Compile .scss files using libsass"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-encode-locale>=0.01' 'perl-extutils-cppguess>=0.14' 'perl-file-chdir>=0.01' 'perl-filesys-notify-simple>=0.01' 'perl-yaml-libyaml>=0')
makedepends=()
checkdepends=('perl-test-differences>=0.01')
url='https://metacpan.org/release/CSS-Sass'
source=("http://search.cpan.org/CPAN/authors/id/O/OC/OCBNET/CSS-Sass-$pkgver.tar.gz")
md5sums=('f7384aae1757468224c125a5b38d5ba9')
sha512sums=('cfffd49717779ea99a1346e1c1ad55a0ccdf6b6a64bf77fdcc4581646ac964b3665a5ff4762578e0c9baabe40e341d10740dbdd46117acd3160cd443edb0c228')
_distdir="CSS-Sass-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
