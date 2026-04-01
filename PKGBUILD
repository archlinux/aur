# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERIGRIN
_dist=HTTP-Thin
pkgname=perl-${_dist@L}
pkgver=0.006
pkgrel=1
pkgdesc='A Thin Wrapper around HTTP::Tiny to play nice with HTTP::Message'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-class-method-modifiers'
    'perl-hash-multivalue'
    'perl-http-message'
    'perl-http-tiny'
    'perl-parent'
    'perl-safe-isa'
)
makedepends=('perl-extutils-makemaker>=6.30')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c4a78588c194603222b0a6b426e61692189def0ce4a0581791873b8720f79e9e')

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
