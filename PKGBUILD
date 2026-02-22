# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_dist='Test-Mojibake'
pkgname='perl-test-mojibake'
pkgver=1.3
pkgrel=2
pkgdesc='check your source for encoding misbehavior'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-pathtools'
    'perl-pod-usage'
    'perl-test-simple'
    'perl-unicode-checkutf8'
    'perl-unicode-checkutf8'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-encode'
    'perl-io'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/S/SY/SYP/$_dist-$pkgver.tar.gz")
sha256sums=('8ffe75ff9b69352488727dca73db91f8aa14b59f2fa104eb7717c0d71a5f1b33')

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
