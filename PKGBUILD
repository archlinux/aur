# Maintainer: PhotonX <michael dot kogan at gmx dot net>

pkgname=perl-goocanvas2-cairotypes
_perl_module=GooCanvas2-CairoTypes
pkgver=0.001
pkgrel=3
pkgdesc="Bridge between GooCanvas2 and Cairo types"
arch=('any')
url="https://metacpan.org/release/${_perl_module}"
license=('PerlArtistic' 'GPL')
depends=('goocanvas' 'perl-gtk3')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
source=("https://cpan.metacpan.org/authors/id/A/AS/ASOKOLOV/${_perl_module}-${pkgver}.tar.gz")
sha256sums=('ba806736ebcc9de3d8141a763a682bdeabb1cb8702bde299adfd574ace875052')
options=('!emptydirs')

prepare() {
  cd "${_perl_module}-${pkgver}"
  sed -i "s/goocanvas-2.0/goocanvas-3.0/" Makefile.PL
}


build() {
  cd "${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd "${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  # Delete unuseful files
  find "${pkgdir}" -name '.packlist' -delete
}
