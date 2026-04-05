# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_author=ETHER
_dist=B-Hooks-OP-Check
pkgname=perl-${_dist@L}
pkgver=0.22
pkgrel=2
pkgdesc='Wrap OP check callbacks'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-parent'
    'perl>=5.8.1'
)
makedepends=(
    'perl-extutils-depends>=0.302'
    'perl-extutils-makemaker'
)
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.8.1'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c7b5d1bef59ef9087ff67eb3168d2624be94ae5464469e259ad11bfb8ad8cdcd')

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
