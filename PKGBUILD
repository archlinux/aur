# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Amish <contact at via dot aur>
# Contributor: Christian Hesse <mail@earthworm.de>
# Contributor: mr_nuub

pkgname=perl-authen-pam
pkgver=0.16
pkgrel=4
pkgdesc="Perl interface to PAM library"
_dist=Authen-PAM
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/N/NI/NIKIP/${_dist}-${pkgver}.tar.gz"
        "dotinc.patch")
md5sums=('7278471dfa694d9ef312bc92d7099af2'
         '09fae4f73d80b8cc9acc72105e9109d2')
sha512sums=('2419698193697cb8c9ac3a1527a25abefffd9f15f4b492006081b2c8e7fe9e01e00f33e8fed6a07611b725b38ed92d9feb51b8ba61e4c23313cc5ff9ea1c05fd'
            'd42c9eeeb740d8fd82d948570bb95a139d82ca404b5df43459cf423006d53f8dfac67e19ee8c8ea9cb3346d9e04a23600b4a8c2e4d9825a9c4db135ccea00b92')

prepare() {
  cd "${srcdir}/${_dist}-${pkgver}"
  patch -p1 -i ../dotinc.patch
}

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
