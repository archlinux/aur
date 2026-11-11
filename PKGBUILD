# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=YVES
_dist=Data-Dump-Streamer
pkgname=perl-${_dist@L}
pkgver=3.001
pkgrel=1
pkgdesc='Accurately serialize a data structure as Perl code.'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-data-dumper'
    'perl-exporter'
    'perl-io'
    'perl>=5.18.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-base'
    'perl-carp'
    'perl-file-temp'
    'perl-scalar-list-utils'
    'perl-test-simple'
)
optdepends=(
    'perl-algorithm-diff'
    'perl-cpanel-json-xs'
    'perl-io-compress'
    'perl-mime-base64'
    'perl-padwalker>=0.99'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c5aacd11eb4f09e587b6927a09d0c66799070be0ae3751094c69ff44a7705b86')

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
