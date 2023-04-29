# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-dist-zilla-plugin-run'
_module='Dist-Zilla-Plugin-Run'
_author='E/ET/ETHER'
pkgver='0.049'
pkgrel='1'
pkgdesc='Run external commands and code at specific phases of Dist::Zilla.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-dist-zilla')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-deep' 'perl-test-file-sharedir')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('cdbaebab34a163524baccc02dad3027d3bc3d269854e2a700468f82112a62b7a')

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
