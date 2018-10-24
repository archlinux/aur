# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname=Devel-Trepan

pkgname=perl-devel-trepan
pkgver=1.0.0
pkgrel=1
pkgdesc="A modular gdb-like Perl debugger"
arch=('any')
license=('GPL')
url="https://metacpan.org/release/${_distname}"
depends=('perl'
         'perl-array-columnize'
         'perl-devel-callsite'
	       'perl-file-homedir'
         'perl-marpa-r2'
         'perl-padwalker'
         'perl-syntax-highlight-perl-improved'
         'perl-rlib')
# TODO...
optdepends=(#'perl-b-codelines'
            'perl-data-printer'
            'perl-data-dumper-concise'
            #'perl-devel-trepan-deparse'
            #'perl-devel-trepan-disassemble'
            #'perl-devel-trepan-shell'
            'perl-eval-withlexicals'
            #'perl-term-readLine-perl5'
            )
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-v${pkgver}.tar.gz")
sha512sums=('64a872010a8b8cd64459e913712167eaca8c7e12f065ab309c7d9c6ff419aa2fdc1abfe99760cef7859dc3a3cef34a44f3b9c8d64a4306b6823913d990fc7753')

build() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
  perl Build.PL INSTALLDIRS=vendor
  ./Build
}

check () {
  cd "${srcdir}/${_distname}-v${pkgver}"
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
