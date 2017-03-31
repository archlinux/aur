# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-moosex-aliases'
_module='MooseX-Aliases'
_author='D/DO/DOY'
pkgver='0.11'
pkgrel='2'
pkgdesc='Easy aliasing of methods and attributes in Moose.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=2.0000')
checkdepends=('perl-moose' 'perl-test-fatal')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('c4850f972426c3447aaeed8dcb4033e84460ca51705ad3ea78b63af919fe0748')

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