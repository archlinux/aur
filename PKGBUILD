# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DROLSKY
_dist=Specio-Library-Path-Tiny
pkgname=perl-${_dist@L}
pkgver=0.05
pkgrel=2
pkgdesc='Path::Tiny types and coercions for Specio'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Apache-2.0')
depends=(
    'perl'
    'perl-parent'
    'perl-path-tiny>=0.087'
    'perl-scalar-list-utils'
    'perl-specio'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    # Missing deps in perl-specio package (bug).
    'perl-module-implementation'
    'perl-sub-quote'

    'perl-extutils-makemaker'
    'perl-file-pushd'
    'perl-file-temp>=0.18'
    'perl-pathtools'
    'perl-specio'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('60df0bb9bcdaeb2c66a078bf6df9954ea4f9433d6cb680889942e542c7c27a51')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
