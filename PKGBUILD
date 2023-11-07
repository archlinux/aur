# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>
# Contributor: Brian Bidulock <bidulock@Openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-log-dispatch'
_module='Log-Dispatch'
_author='D/DR/DROLSKY'
pkgver='2.71'
pkgrel='1'
pkgdesc='Dispatches messages to one or more outputs'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
   'perl>=5.006'
   'perl-devel-globaldestruction'
   'perl-dist-checkconflicts>=0.02'
   'perl-ipc-run3'
   'perl-module-runtime'
   'perl-namespace-autoclean'
   'perl-params-validationcompiler'
   'perl-specio>=0.32'
   'perl-try-tiny'
)
checkdepends=(
   'perl-test-fatal'
   'perl-test-needs'
)
url="https://metacpan.org/release/$_module"
source=("https://cpan.metacpan.org/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('9d60d9648c35ce2754731eb4deb7f05809ece1bd633b74d74795aed9ec732570')

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
