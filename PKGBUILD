# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=not-forking
pkgver=0.5
pkgrel=3
pkgdesc='Tool for merging multiple upstreams without forking.'
arch=('any')
url="https://lumosql.org/src/not-forking"
license=('custom: MIT' 'custom: cc-by-sa-4.0')
depends=('perl')
makedepends=('fossil')
checkdepends=('perl-text-glob')
options=('!emptydirs' 'purge')
source=("${pkgname}::fossil+${url}#tag=version-${pkgver}")
sha256sums=(SKIP)

build() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  install -Dm644 LICENCES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
  install -Dm644 LICENCES/CC-by-SA-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/CC-by-SA-4.0.txt"
}
