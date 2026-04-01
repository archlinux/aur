# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Christos Nouskas <nous@archlinux.us>

_author=DROLSKY
_dist=URI-FromHash
pkgname=perl-${_dist@L}
pkgver=0.05
pkgrel=1
pkgdesc='Build a URI from a set of named parameters'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-2.0')
depends=(
    'perl'
    'perl-carp'
    'perl-exporter'
    'perl-params-validate'
    'perl-uri>=1.68'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('a7cac5bccee9f2e2d8ad0f605400163712cd0ac64df2fb834f760fb49f2f6fd0')

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
