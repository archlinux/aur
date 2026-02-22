# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Minimalist <stefanguen@gmail.com>

_dist='HTTP-BrowserDetect'
pkgname='perl-http-browserdetect'
pkgver=3.45
pkgrel=3
pkgdesc='Determine Web browser, version, and platform from an HTTP user agent string'
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
url="https://metacpan.org/dist/$_dist"
depends=('perl>=5.6.0')
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-findbin'
    'perl-json-pp>=4.04'
    'perl-path-tiny'
    'perl-pathtools'
    'perl-scalar-list-utils>=1.49'
    'perl-test-differences'
    'perl-test-nowarnings'
    'perl-test-simple'
    'perl-test-warnings'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/$_dist-$pkgver.tar.gz")
sha256sums=('d4dbfddd9df6e9c35d151c9b00544211b38cb8c3aee4350a540bddaa75203669')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
