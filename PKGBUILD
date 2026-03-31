# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=RJBS
_dist=Module-Faker
pkgname=perl-${_dist@L}
pkgver=0.027
pkgrel=1
pkgdesc='build fake dists for testing CPAN tools'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-archive-any-create'
    'perl-carp'
    'perl-cpan-distnameinfo'
    'perl-cpan-meta'
    'perl-cpan-meta-requirements'
    'perl-data-fake'
    'perl-data-optlist'
    'perl-encode'
    'perl-experimental'
    'perl-file-next'
    'perl-file-path'
    'perl-file-temp'
    'perl-getopt-long-descriptive'
    'perl-moose'
    'perl-parent'
    'perl-path-class>=0.06'
    'perl-scalar-list-utils'
    'perl-storable'
    'perl-sub-exporter'
    'perl-text-template'
    'perl>=5.20.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-json-pp'
    'perl-path-class>=0.06'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('bba533d06c197608087f03d0b1e7e327d74165e7b49a46a372a7af2c1f1883dc')

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
