# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=perl-chemistry-mol
pkgver=0.38
pkgrel=1
pkgdesc="Molecule object toolkit"
_dist="Chemistry-Mol"
arch=(any)
url="https://metacpan.org/pod/Chemistry::Mol"
license=(GPL PerlArtistic)
depends=(perl 'perl-math-vectorreal>=1.0' 'perl-scalar-util>=1.01' perl-test-simple perl-text-balanced)
options=(purge !emptydirs)
source=("https://cpan.metacpan.org/authors/id/M/ME/MERKYS/${_dist}-${pkgver}.tar.gz")
sha256sums=('8d529a1b3ea5100d8ab13406c69b81d83d8ce6ff21745e94eadbafb9e3e8bc73')

build() {
    cd "${srcdir}/${_dist}-${pkgver}"
    
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_dist}-${pkgver}"

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
  
    make test
}

package() {
    cd "${srcdir}/${_dist}-${pkgver}"

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
