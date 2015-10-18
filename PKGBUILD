# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-moosex-types-path-class'
pkgver='0.08'
pkgrel='1'
pkgdesc="A Path::Class type library for Moose"
_dist='MooseX-Types-Path-Class'
arch=('any')
url="http://search.cpan.org/dist/MooseX-Types-Path-Class"
license=('PerlArtistic' 'GPL')
depends=('perl-moosex-getopt' 'perl-moosex-types' 'perl-path-class>=0.16')
options=('!emptydirs' purge)
makedepends=('perl-module-build-tiny>=0.007')
checkdepends=('perl-extutils-makemaker>=6.30' 'perl-moose')
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/${_dist}-${pkgver}.tar.gz")
sha512sums=('d206b32d765f7766e18cc15a045f1ab34efa160aa699823a9be437861bc2a3c8deee0bf66a46b7e2ccb5fc6ba25fa18c40391606f25c5a9e024f7744be7841c7')

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
