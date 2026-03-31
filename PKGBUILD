# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Archer777 <NAME at gmx dot com>

_author=NEILB
_dist=Smart-Comments
pkgname=perl-${_dist@L}
pkgver=1.06
pkgrel=1
pkgdesc='Comments that do more than just sit there'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper'
    'perl-filter-simple'
    'perl-scalar-list-utils'
    'perl-text-balanced'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('dcf8a312134a7c6b82926a0115d93b692472a662d28cdc3a9bdf28984ada9ee3')

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
