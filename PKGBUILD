# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=RSAVAGE
_dist=Tree-Simple-VisitorFactory
pkgname=perl-${_dist@L}
pkgver=0.16
pkgrel=2
pkgdesc='A factory object for dispensing Visitor objects'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-base'
    'perl-pathtools>=0.6'
    'perl-scalar-list-utils>=1.1'
    'perl-tree-simple>=1.12'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-exception>=0.15'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tgz")
sha256sums=('9cf538faa12c54ffb4a91439945e488f1856f62b89ac5072a922119e01880da6')

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
