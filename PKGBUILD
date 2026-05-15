# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=NICOMEN
_dist=Mojo-UserAgent-Cached
pkgname=perl-${_dist@L}
pkgver=1.25
pkgrel=1
pkgdesc='Caching, Non-blocking I/O HTTP, Local file and WebSocket user agent'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-algorithm-lcss'
    'perl-chi'
    'perl-data-serializer'
    'perl-devel-stacktrace'
    'perl-file-path'
    'perl-mojolicious>=8.72'
    'perl-pathtools'
    'perl-readonly'
    'perl-scalar-list-utils>=1.29'
    'perl-string-truncate'
    'perl-time-hires'
    'perl>=5.10.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-io-compress'
    'perl-module-install'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9599a29138eafd928f585ee30ef166d23ff1dc52a4067e74872c51e16dec864a')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
