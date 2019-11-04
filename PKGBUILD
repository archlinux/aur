# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname=Devel-Trepan

pkgname=perl-devel-trepan
pkgver=1.0.1
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
optdepends=('perl-b-codelines'
            'perl-data-printer'
            'perl-data-dumper-concise'
            'perl-devel-trepan-deparse: add deparse support'
            #'perl-devel-trepan-disassemble'
            #'perl-devel-trepan-shell'
            'perl-eval-withlexicals'
            'perl-term-readline-perl5'
            'perl-pod-parser')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-v${pkgver}.tar.gz")
sha512sums=('040f66647797cc058b202c926121201c8895b91cdd4080a5244bfaa44a4ca4b5cfc008019bfa762a81416061fce30e014325234f449f60f2d5860cb862e79386')

build() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps' MODULEBUILDRC='/dev/null'
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-v${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
