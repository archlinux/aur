# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=HAARG
_dist=Catalyst-Plugin-ConfigLoader
pkgname=perl-${_dist@L}
pkgver=0.35
pkgrel=2
pkgdesc='Load config files of various types'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-runtime>=5.7008'
    'perl-config-any>=0.20'
    'perl-data-visitor>=0.24'
    'perl-mro-compat>=0.09'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9e2a698a6f2d046e0dc5e57512929cd423c807d4a36ba3f29e9e5adcd71a1971')

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
