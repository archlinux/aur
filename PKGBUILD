pkgname="perl-authen-totp"
pkgver=0.0.7
pkgrel=1
pkgdesc="TOTP implementation"
url="https://metacpan.org/pod/Authen::TOTP"
license=("GPL")
arch=('any')
depends=("perl-mime-base32")
makedepends=('perl-module-build-tiny')
source=("https://cpan.metacpan.org/authors/id/T/TC/TCHATZI/Authen-TOTP-$pkgver.tar.gz")
sha256sums=('8e5d3c504696b42fd66ac40787a85d721d7db11e0218c72503c8089db22c3287')

prepare_environment() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  cd "${srcdir}/Authen-TOTP-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install --installdirs=vendor --destdir="$pkgdir"
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
