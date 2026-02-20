# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: David Phillips < dbphillipsnz , gmail >
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

_dist='POE-Component-IRC'
pkgname='perl-poe-component-irc'
pkgver=6.95
pkgrel=1
pkgdesc='A fully event-driven IRC client module'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-irc-utils>=0.12'
    'perl-poe-component-client-dns'
    'perl-poe-component-syndicator'
    'perl-poe-filter-ircd>=2.42'
    'perl-poe>=1.311'
    'perl-scalar-list-utils>=1.33'
    'perl>=5.8.1'
)
checkdepends=(
    'perl-test-differences>=0.61'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/B/BI/BINGOS/$_dist-$pkgver.tar.gz")
sha256sums=('77c8cd8c726f1dae242c4ba5569586e9add8a62c6a317738e92af8f55f2fefdd')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
