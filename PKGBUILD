# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist=POE-Component-Curl-Multi
_ver=1.02
pkgname=perl-${_dist,,}
pkgver=${_ver#v}
pkgrel=3
pkgdesc='a fast HTTP POE component'
arch=('any')
url=https://metacpan.org/release/BINGOS/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-http-message>=5.810'
    'perl-net-curl>=0.47'
    'perl-poe'
    'perl-uri>=1.37'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/B/BI/BINGOS/$_dist-$_ver.tar.gz")
sha256sums=('9206a0eda9b06c88bd8514c3e296a1ccec3b71432922208c95e8e7a9adeb0961')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
