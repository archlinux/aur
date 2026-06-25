# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=ETHER
_dist=Context-Preserve
pkgname=perl-${_dist@L}
pkgver=0.03
pkgrel=4
pkgdesc='Run code after a subroutine call, preserving the context the subroutine would have seen if it were the last statement in the caller'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-base'
    'perl-carp'
    'perl-exporter'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-exception'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('09914a4c2c7bdb99cab680c183cbf492ec98d6e23fbcc487fcc4ae10567dfd1f')

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
