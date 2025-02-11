# Maintainer: dringsim <dringsim@qq.com> 
pkgname=perl-moox-singleton
pkgver=1.20
pkgrel=1
pkgdesc='turn your Moo class into singleton '
_dist=MooX-Singleton
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-role-tiny')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/A/AJ/AJGB/$_dist-$pkgver.tar.gz")
sha256sums=('f7d7626fffde98f85ec12c1ee26b01f139a4dddd2f453ea56c341df194e3210e')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
