# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=perl-chemistry-mol
pkgver=0.37
pkgrel=1
pkgdesc="Molecule object toolkit"
_dist="Chemistry-Mol"
arch=(any)
url="https://metacpan.org/pod/Chemistry::Mol"
license=(GPL PerlArtistic)
depends=(perl 'perl-math-vectorreal>=1.0' 'perl-scalar-util>=1.01' perl-test-simple perl-text-balanced)
options=(purge !emptydirs)
source=("https://cpan.metacpan.org/authors/id/I/IT/ITUB/${_dist}-${pkgver}.tar.gz")
md5sums=('b3826c67e866a99169f3cfec1205642a')

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
