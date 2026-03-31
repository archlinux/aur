# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DAGOLDEN
_dist=Data-Fake
pkgname=perl-${_dist@L}
pkgver=0.006
pkgrel=1
pkgdesc='Declaratively generate fake structured data for testing'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Apache-2.0')
depends=(
    'perl-carp'
    'perl-exporter>=5.57'
    'perl-import-into>=1.002005'
    'perl-scalar-list-utils'
    'perl-text-lorem'
    'perl-time-piece>=1.27'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-deep'
    'perl-test-simple'
    'perl>=5.8.1'
)
optdepends=(
    'perl-cpan-meta'
    'perl-json-pp'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('930960e04a417fb19e14ce1e739e3e4aefbddd101eae68bfa25ba7674fe7c2a1')

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
