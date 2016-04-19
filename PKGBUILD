# Maintainer: pzl <alsoelp _at_ gmail>
# CPAN Name  : Devel::CheckLib

pkgname='perl-devel-checklib'
pkgver='1.07'
pkgrel='1'
pkgdesc="Module to check if other perl modules are installed"
arch=('any')
url='http://search.cpan.org/dist/Devel-CheckLib/'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-io-captureoutput')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MATTN/Devel-CheckLib-${pkgver}.tar.gz")
md5sums=('66c76e5cdbae547bb61c3e872f0c6479')
_distdir="Devel-CheckLib-${pkgver}"

prepare() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null
}

build() {
    cd "${srcdir}/${_distdir}"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${_distdir}"
    make test
}

package() {
    cd "${srcdir}/${_distdir}"
    make install

    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


