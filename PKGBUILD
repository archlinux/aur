# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Anonymous

_author=PERIGRIN
_dist=XML-NamespaceFactory
pkgname=perl-${_dist@L}
pkgver=1.02
pkgrel=2
pkgdesc='Simple factory objects for SAX namespaced names.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=('perl-test')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('94b6dd0df4a8dc8ce83623e5d23413433ff1a01a302e8215425219b1ec19bb23')

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
