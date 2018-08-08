# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-test-version'
_module='Test-Version'
_author='P/PL/PLICEASE'
pkgver='2.09'
pkgrel='1'
pkgdesc='Check to see that versions in modules are sane.'
arch=('any')
url="https://metacpan.org/release/$_module"
depends=('perl-file-find-rule-perl')
checkdepends=('perl-test-exception')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('9ce1dd2897a5f30e1b7f8966ec66f57d8d8f280f605f28c7ca221fa79aca38e0')

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