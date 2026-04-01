# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Christos Nouskas <nous@archlinux.us>

_author=TOBYINK
_dist=Types-URI
pkgname=perl-${_dist@L}
pkgver=0.007
pkgrel=1
pkgdesc='type constraints and coercions for URIs'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-type-tiny'
    'perl-types-path-tiny'
    'perl-types-uuid'
    'perl-uri'
    'perl-uri-fromhash'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-test-requires'
    'perl-test-simple'
)
optdepends=(
    'perl-attean'
    'perl-iri'
    'perl-moose'
    'perl-rdf-trine'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4c159ff53c5c383eb8eedf93d6310b26bcc83ae0547560968e65c57926df0304')

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
