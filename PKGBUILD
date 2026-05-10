# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
pkgname="perl-${_name}"
pkgver=1.6.2
pkgrel=1
pkgdesc="iTeX to MathML converter (Perl bindings)"
arch=(
  'x86_64'
)
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=(
  'GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1'
  'Artistic-1.0-Perl'
)
depends=(
  'glibc'
  'perl'
)
options=(
  '!emptydirs'
  'purge'
)
_pkgsrc="itexToMML"
source=(
  "https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz"
)
sha256sums=('8af5a7443df87f74e0cdf2bce27dd78396566cbcffaf15efe1e87325fa6b15d3')

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}/itex-src/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  install -vDm644 "README"  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
