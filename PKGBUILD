# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=NEILB
_dist=Time-Duration-Parse
_ver=0.16
pkgname=perl-${_dist@L}
pkgver=${_ver#v}
pkgrel=3
pkgdesc='Parse string that represents time duration'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-exporter>=5.57'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-simple'
    'perl-time-duration'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$_ver.tar.gz")
sha256sums=('1084a6463ee2790f99215bd76b135ca45afe2bfa6998fa6fd5470b69e1babc12')

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
