# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-test-version'
_module='Test-Version'
_author='P/PL/PLICEASE'
pkgver='2.05'
pkgrel='1'
pkgdesc='Check to see that versions in modules are sane.'
arch=('any')
url="https://metacpan.org/release/$_module"
depends=('perl-file-find-rule-perl')
checkdepends=('perl-test-exception')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('39c0ec02663da0e56962bdafaef6790cf83d12b4d90e8a4cdc971d57d869d63f')

build() {
   (
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
      cd "$_module-$pkgver"
      perl Makefile.PL INSTALLDIRS='vendor'
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