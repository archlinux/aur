# CPAN Name  : URI-Find
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

pkgname="perl-uri-find"
_cpanname="URI-Find"
pkgver="20160806"
pkgrel="1"
pkgdesc="Find URIs in plain text"
arch=('any')
url='http://metacpan.org/pod/URI::Find'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-uri>=1.00')
makedepends=('perl-module-build')
options=('!emptydirs')
md5sums=('744411a9fe3865f8f580b1b5fea8c7e5')
source=("http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/${_cpanname}-${pkgver}.tar.gz")

build() {
    cd "$srcdir"/"${_cpanname}-${pkgver}"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""               \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
    /usr/bin/perl Build.PL
    /usr/bin/perl Build 
}

check(){
    cd "$srcdir"/"${_cpanname}-${pkgver}"
    /usr/bin/perl Build test
}

package() {
    cd "$srcdir"/"${_cpanname}-${pkgver}"
    /usr/bin/perl Build install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

