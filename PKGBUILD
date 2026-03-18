# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PEVANS
_dist=Syntax-Keyword-Match
pkgname=perl-${_dist@L}
pkgver=0.15
pkgrel=1
pkgdesc='a match/case syntax for perl'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-sharedir'
    'perl-xs-parse-keyword>=0.36'
    'perl>=5.16.0'
)
makedepends=(
    'perl-extutils-cbuilder'
    'perl-module-build>=0.4004'
    'perl-xs-parse-keyword'
)
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9c428f2fb55dac4ec511f69e37ceb5f367034e475b079f59cf6abb82114f5ca3')

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
