# Maintainer: pzl <alsoelp _at_ gmail>
# CPAN Name  : ExtUtils-ParseXS

pkgname='perl-extutils-parsexs'
pkgver='3.24'
pkgrel='1'
pkgdesc="Converts Perl XS code into C code"
arch=('any')
url='http://search.cpan.org/dist/ExtUtils-ParseXS'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/ExtUtils-ParseXS-${pkgver}.tar.gz")
md5sums=('e6be3f1d493e04ed805576104cf4328b')

prepare() {
    export _srcdir="${srcdir}/ExtUtils-ParseXS-${pkgver}" \
        PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null
}


build() {
    cd "${_srcdir}"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${_srcdir}"
    make test
}

package() {
    cd "${_srcdir}"
    make install

    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


