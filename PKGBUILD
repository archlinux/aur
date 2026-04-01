# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=ETHER
_dist=JSON-Any
pkgname=perl-${_dist@L}
pkgver=1.40
pkgrel=1
pkgdesc='(DEPRECATED) Wrapper Class for the various JSON classes'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-constant'
    'perl>=5.8.0'
)
makedepends=(
    'perl-cpan-meta-requirements>=2.120620'
    'perl-extutils-makemaker'
    'perl-module-metadata'
)
checkdepends=(
    'perl-data-dumper'
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-storable'
    'perl-test-fatal'
    'perl-test-needs'
    'perl-test-simple'
    'perl-test-warnings>=0.009'
    'perl-test-without-module'
    'perl>=5.8.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('083256255a48094fd9ac1239e0fea8a10a2383a9cd1ef4b1c7264ede1b4400ab')

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
