# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-pod-spell-commonmistakes'
_module='Pod-Spell-CommonMistakes'
_author='A/AP/APOCAL'
pkgver='1.002'
pkgrel='1'
pkgdesc='Catches common typos in Pod.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-io-stringy' 'perl-pod-spell')
makedepends=('perl-module-build-tiny')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('2ba9ea76c049daf892ba2bdd85a07099a33be315876f55ed33a644d575324432')

build() {
   (
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
      cd "$_module-$pkgver"
      /usr/bin/perl Makefile.PL
      make
   )
}

check() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1'
      make test
   )
}

package() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      make install INSTALLDIRS='vendor' DESTDIR="$pkgdir"
      find "$pkgdir" -name .packlist     -delete
      find "$pkgdir" -name perllocal.pod -delete
      find "$pkgdir" -type d -empty      -delete
   )
}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87:
