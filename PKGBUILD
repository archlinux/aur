# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Kars Wang <jaklsy AT gmail.com>

_author=TOBYINK
_dist=Test-Modern
pkgname=perl-${_dist@L}
pkgver=0.013
pkgrel=2
pkgdesc='precision testing for modern perl'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-exporter-tiny>=0.030'
    'perl-import-into>=1.002000'
    'perl-module-runtime>=0.012'
    'perl-test-api>=0.004'
    'perl-test-deep>=0.111'
    'perl-test-fatal>=0.007'
    'perl-test-simple'
    'perl-test-warnings>=0.009'
    'perl-try-tiny>=0.15'
    'perl>=5.6.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
optdepends=(
    'perl-cpan-meta-requirements'
    'perl-libwww'
    'perl-moose'
    'perl-namespace-clean'
    'perl-test-longstring'
    'perl-test-pod'
    'perl-test-pod-coverage'
    'perl-test-version'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('63ebc04b761c5748a121006d0e2672a6836d39cfb9e0b42dda80c8161f7a1246')

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
