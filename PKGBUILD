# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: suthernfriend <public@janpeterkoenig.com>
# Contributor: ajs124 < aur AT ajs124 DOT de >
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_author=ANDYA
_dist=IPC-ShareLite
pkgname=perl-${_dist@L}
pkgver=0.17
pkgrel=7
pkgdesc='Lightweight interface to shared memory'
arch=(
    'x86_64'
    'aarch64'
    'armv7h'
)
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-pathtools'
    'perl-test-simple'
)
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('14d406b91da96d6521d0d1a82d22a306274765226b86b0a56e7ffddcf96ae7bf')

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
