# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Peven Phoon <iampeven@gmail.com>

_dist=Regexp-Debugger
pkgname=perl-regexp-debugger
pkgver=0.002007
pkgrel=1
pkgdesc='Visually debug regexes in-place'
arch=('any')
url='https://metacpan.org/pod/Regexp::Debugger'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-test-simple'
    'perl>=5.10.1'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/$_dist-$pkgver.tar.gz")
sha256sums=('db096cf2e0e1e6127dacc40be6fbd526aa5ad41886a5bae00f4fe6a53a6c6ffb')

build()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL
    make
}


check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
