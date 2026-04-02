# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=BOBTFISH
_dist=Catalyst-Plugin-Session-Store-DBIC
pkgname=perl-${_dist@L}
pkgver=0.14
pkgrel=2
pkgdesc='Store your sessions via DBIx::Class'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-catalyst-plugin-session-store-delegate>=0.05'
    'perl-catalyst-runtime'
    'perl-class-accessor'
    'perl-dbix-class>=0.07000'
    'perl-findbin'
    'perl-mime-base64'
    'perl-mro-compat'
    'perl-scalar-list-utils'
    'perl-storable'
    'perl-test-simple'
    'perl-test-warn>=0.20'
)
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('db8f4a139e31aed0b40d62a0ff44b1bdc57308d8f5f61f54a4caa4769301e5ac')

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
