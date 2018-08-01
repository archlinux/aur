# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Magnus Woldrich <magnus@trapd00r.se>

pkgname=perl-term-extendedcolor
_cpanname=Term-ExtendedColor
pkgver=0.224
pkgrel=6
pkgdesc="Like Term::ANSIColor, but for the extended colorset"
url='http://search.cpan.org/dist/Term-ExtendedColor'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::http://search.cpan.org/CPAN/authors/id/W/WO/WOLDRICH/${_cpanname}-${pkgver}.tar.gz)
sha512sums=('d4d5ccd3b1a8ffd4a15fa360bbcda0167fcce1fcc128da5fc23e05f891e3e1e403250c43d358ce16f6cab7034a67d76cc3bd8ed2926185f75208cd6d3b9d4547')

build() {
  cd ${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd ${_cpanname}-${pkgver}
  make test
}

package() {
  cd ${_cpanname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

# vim: ts=2 sw=2 et:
