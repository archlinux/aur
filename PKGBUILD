# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-dist-zilla-plugin-run'
_module='Dist-Zilla-Plugin-Run'
_author='E/ET/ETHER'
pkgver='0.050'
pkgrel='1'
pkgdesc='Run external commands and code at specific phases of Dist::Zilla.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=(' GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs' 'purge')
depends=('perl-dist-zilla')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-deep' 'perl-test-file-sharedir')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('4b5c4045ef96f16b55c132c1f11b9ab19e2d136716f50bb47d78cda9ae5be54d')

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
