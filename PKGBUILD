# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-data-simplepath'
_module='Data-SimplePath'
_author='S/ST/STG'
pkgver='0.005'
pkgrel='4'
pkgdesc='Path-like access to complex data structures.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-classapi' 'perl-test-nowarnings' 'perl-test-warn')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('c4b85bdde841b09010cb4cf75ddaecac4aee8f8b0c233615579f24fd732d84bd')

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
