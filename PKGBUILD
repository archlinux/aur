# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-devel'
pkgver='1.42'
pkgrel='1'
pkgdesc="Catalyst Development Tools"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-install' 'perl-catalyst-action-renderview' 'perl-catalyst-plugin-configloader' 'perl-catalyst-plugin-static-simple' 'perl-config-general' 'perl-file-changenotify' 'perl-file-copy-recursive' 'perl-template-toolkit')
makedepends=('perl-test-fatal' 'perl-file-sharedir-install')
checkdepends=('perl-perlio-utf8-strict')
url='http://search.cpan.org/dist/Catalyst-Devel'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Catalyst-Devel-${pkgver}.tar.gz")
md5sums=('4c51b2c27c23942551b74a4db5fdc4d3')
sha512sums=('246786d5d6f83a51b474bd095571d648a25d5482b5af15f0062622aa3f3052b7ac0be5f67916772efdf85d56deedc4a3b96b7e504f9b6565a52f963a54c6e2d4')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Catalyst-Devel-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Catalyst-Devel-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Catalyst-Devel-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
