# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-moosex-daemonize'
pkgver='0.21'
pkgrel='1'
pkgdesc="Role for daemonizing your Moose based application"
_dist='MooseX-Daemonize'
arch=('any')
url="http://search.cpan.org/dist/MooseX-Daemonize"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.008' 'perl-moose>=0.33' 'perl-moosex-getopt>=0.07' 'perl-moosex-types-path-class')
options=('!emptydirs' purge)
makedepends=('perl-module-build-tiny>=0.034' 'perl-devel-checkos>=1.63')
checkdepends=('perl-test-fatal')
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/${_dist}-${pkgver}.tar.gz")
sha512sums=('2a4f2549edd4cf8f918b59c7df7f9d7e72f23c8d0c927929d15e20679f427eef11f601a1e72a71eb225ed67389e63a92a6579524f843c20c2dd524cec2fe8a7d')

sanitize() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build.PL --installdirs vendor --destdir "$pkgdir"
  perl Build
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
