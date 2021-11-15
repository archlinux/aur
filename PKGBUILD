# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Daniel Golle

pkgname=perl-digest-crc
_realname=Digest-CRC
pkgver=0.23
pkgrel=1
# Fix archive name
_revision=
pkgdesc="Generic interface to CRC algorithms"
arch=('i686' 'x86_64')
license=('custom:Public Domain')
url="https://metacpan.org/release/${_realname}"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/O/OL/OLIMAUL/${_realname}-${pkgver}${_revision}.tar.gz"
        "COPYING" # From README in source directory
        )
sha512sums=('983dfb3a39ca054819906bd67251f0e275a55d4ab1873146a8bbe36dee3d979e67a36f3fc53ce18608873a1c68ba30d6de8c59b58ae57a7e36e6816551752875'
            '9931cc165ead33233e5ca71b7cf388c882dfeb5b0f21fd891113139579106574860141a23303970b17fc3da2d7390e6b2b2ff438acf599db4a0b7ff05d85822f')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

check () {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  make install DESTDIR="$pkgdir"

  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete

  install -D -m0644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
sha512sums=('b92e40bf717882b0e694c6552a88f13ac92a569e4484eedfdfc57b7fe867e29a81e228d00c29e9e4ba120cb9e0ca4d10db12cad5af185893ebcd89b1be87d2c1'
            '9931cc165ead33233e5ca71b7cf388c882dfeb5b0f21fd891113139579106574860141a23303970b17fc3da2d7390e6b2b2ff438acf599db4a0b7ff05d85822f')
