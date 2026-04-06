# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: Christos Nouskas <nous@archlinux.us>

_author=DAGOLDEN
_dist=Types-Path-Tiny
pkgname=perl-${_dist@L}
pkgver=0.006
pkgrel=2
pkgdesc='Path::Tiny types and coercions for Moose and Moo'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Apache-2.0')
depends=(
    'perl-path-tiny'
    'perl-type-tiny'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-file-pushd'
    'perl-file-temp>=0.18'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.8.1'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('593fc9faedbc69280659c0cce85168f8e7a1714cacdf8e9e6b7489be18dfe280')

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
