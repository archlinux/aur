# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=TIMLEGGE
_dist=Module-Signature
pkgname=perl-${_dist@L}
pkgver=0.96
pkgrel=1
pkgdesc='Module signature file manipulation'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('CC0-1.0 OR Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-temp'
    'perl>=5.10.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.36'
    'perl-ipc-run'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('461fe5f6a189e6dc85f8776f7534fdb9821ecb3e04d839268d31353f9b429d7e')

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
