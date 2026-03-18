# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PEVANS
_dist=Future-AsyncAwait
pkgname=perl-${_dist@L}
pkgver=0.71
pkgrel=1
pkgdesc='deferred subroutine syntax for futures'
arch=('x86_64')  # XS modules might depend on external libs; manual inspection is advised.
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-sharedir>=1.00'
    'perl-future>=0.50'
    'perl-xs-parse-keyword>=0.13'
    'perl-xs-parse-sublike>=0.31'
    'perl>=5.16.0'                 # Package is flagged out-of-date on 2026-03-09.
)
makedepends=(
    'perl-extutils-cbuilder'
    'perl-module-build>=0.4004'
    'perl-xs-parse-keyword>=0.13'
    'perl-xs-parse-sublike>=0.31'
)
checkdepends=(
    'perl-future'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('16caa557a3e7a95e0e6ff5fe39672aa8580047c75fa7748eb8b1cb183a7beb70')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
