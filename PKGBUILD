# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous

_author=TOBYINK
_dist=RDF-Prefixes
pkgname=perl-${_dist@L}
pkgver=0.005
pkgrel=2
pkgdesc='simple way to turn URIs into QNames'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-test-simple'
    'perl-test-warn'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('058b7232be08ca3bbb7a2dac6184e6469c19d21248910fe9f3494045573469b8')

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
