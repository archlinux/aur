# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Magnus Woldrich <magnus@trapd00r.se>

pkgname=perl-term-extendedcolor
_cpanname=Term-ExtendedColor
pkgver=0.504
pkgrel=4
pkgdesc='Like Term::ANSIColor, but for the extended colorset'
url='https://search.cpan.org/dist/Term-ExtendedColor'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/W/WO/WOLDRICH/${_cpanname}-${pkgver}.tar.gz)
sha512sums=('666c718daca2ae7191d7e92954b6ab7bc7d72add8f88a79f46554b74529c240ed36b796cdbd28aa862c6bc4394a15b5401d053dde814c12d48cc5dd295d78e42')
b2sums=('9a9995f7ce0d56541fb2128c6cbf36e8b3c22613622eab61c7b6f5259f9ab36bf27471fe9d0a3b39d0f4739fb4434d7ca957442f7bba136c74c021d42ae3a660')

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
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

# vim: ts=2 sw=2 et:
