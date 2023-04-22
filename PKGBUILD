# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=not-forking
pkgver=1.0
pkgrel=2
pkgdesc='The Not-forking Software Reproducibility Tool'
arch=('any')
url="https://lumosql.org/src/not-forking"
license=('MIT')
depends=('perl')
options=('!emptydirs' 'purge')
source=("${pkgname}-${pkgver}::fossil+${url}#branch=trunk")
sha256sums=(SKIP)

build() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
