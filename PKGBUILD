# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Christian Sturm <reezer@reezer.org>

_author=MIYAGAWA
_dist=Test-TCP
pkgname=perl-${_dist@L}
pkgver=2.22
pkgrel=3
pkgdesc='testing TCP program'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-io'
    'perl-io-socket-ip'
    'perl-test-sharedfork>=0.29'
    'perl-test-simple'
    'perl-time-hires'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.64')
checkdepends=(
    'perl-file-temp'
    'perl-socket'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('3e53c3c06d6d0980a2bfeb915602b714e682ee211ae88c11748cf2cc714e7b57')

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
