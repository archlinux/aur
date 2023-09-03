# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-log-dispatchouli'
_module='Log-Dispatchouli'
_author='R/RJ/RJBS'
pkgver='3.007'
pkgrel='1'
pkgdesc='A simple wrapper around Log::Dispatch.'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
   'perl-log-dispatch'
   'perl-log-dispatch-array'
   'perl-params-util'
   'perl-string-flogger'
   'perl-sub-exporter'
   'perl-sub-exporter-globexporter>=0.002'
   'perl-try-tiny>=0.04'
)
checkdepends=(
   'perl-eval-closure'
   'perl-namespace-autoclean'
   'perl-params-validationcompiler'
   'perl-specio'
   'perl-test-deep'
   'perl-test-fatal'
)
url="https://metacpan.org/release/$_module"
source=("https://cpan.metacpan.org/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('988118965952ba49a8fa791a6536880c89017f4eb9d72c1745ed67d15c0d272c')

build() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
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
