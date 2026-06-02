# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eduardo Reveles <me@osiux.ws>

_author=RURBAN
_dist=Net-Ping
pkgname=perl-${_dist@L}
pkgver=2.77
pkgrel=1
pkgdesc='check a remote host for reachability'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-socket>=2.007'
    'perl-test-simple'
    'perl-time-hires'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-pod>=1.22'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('280ac87370f553e5fa5dd60e3b5433108b471064a7ee0df784b909a5f2b862c7')

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
