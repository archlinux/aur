# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=ARODLAND
_dist=Catalyst-Plugin-Session-Store-DBIC
pkgname=perl-${_dist@L}
pkgver=0.15
pkgrel=1
pkgdesc='Store your sessions via DBIx::Class'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-catalyst-plugin-session-store-delegate>=0.05'
    'perl-catalyst-runtime'
    'perl-class-accessor'
    'perl-dbix-class>=0.07000'
    'perl-mime-base64'
    'perl-mro-compat'
    'perl-scalar-list-utils'
    'perl-storable'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-findbin'
    'perl-test-simple'
    'perl-test-warn>=0.20'
)
optdepends=(
    'perl-catalyst-model-dbic-schema'
    'perl-catalyst-plugin-session-state-cookie'
    'perl-test-www-mechanize-catalyst'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('298d16c2b4e96e690bf84b01400417c3f287750b5ec2f2983c1e994be88eca7e')

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
