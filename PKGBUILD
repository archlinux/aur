# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: CpanBot <cpanbot at sch bme hu>
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=PETDANCE
_dist=Test-WWW-Mechanize
pkgname=perl-${_dist@L}
pkgver=1.60
pkgrel=5
pkgdesc='Testing-specific WWW::Mechanize subclass'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-2.0')
depends=(
    'perl-carp'
    'perl-carp-assert-more>=1.16'
    'perl-html-form'
    'perl-html-parser'
    'perl-http-message>=6.29'
    'perl-libwww>=6.02'
    'perl-parent'
    'perl-test-longstring>=0.15'
    'perl-test-simple'
    'perl-www-mechanize>=1.68'
    'perl>=5.10.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-http-server-simple'
    'perl-test-simple'
    'perl-uri'
)
optdepends=('perl-html-lint: autolinting')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('23fd72e7ed1be79de1d02a2d15f0df093415e0eab6fc615ff6bb688741268677')

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
