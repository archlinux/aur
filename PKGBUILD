# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

_perlmod=MooX-HandlesVia
pkgname=perl-moox-handlesvia
pkgver=0.001008
pkgrel=4
pkgdesc="MooX::HandlesVia - NativeTrait-like behavior for Moo"
arch=('any')
url="http://search.cpan.org/~mattp/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-moo' 'perl-moox-types-mooselike' 'perl-strictures' 'perl-data-perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MATTP/$_perlmod-$pkgver.tar.gz)
sha256sums=('b0946f23b3537763b8a96b8a83afcdaa64fce4b45235e98064845729acccfe8c')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/${_perlmod}-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

