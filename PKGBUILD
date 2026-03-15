# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SVW
_dist=Time-Out
pkgname=perl-${_dist@L}
pkgver=1.0.0
pkgrel=1
pkgdesc='Easily timeout long running operations'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp>=1.32'
    'perl-exporter'
    'perl-scalar-list-utils'
    'perl-try-tiny'
    'perl-version>=0.9915'
    'perl>=5.8.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-extutils-makemaker-cpanfile>=0.09'
    'perl-lib'
    'perl-pathtools'
    'perl-version>=0.9915'
)
checkdepends=(
    'perl-io'
    'perl-test-fatal'
    'perl-test-harness>=3.50'
    'perl-test-needs'
    'perl-test-simple'
)
optdepends=('perl-time-hires')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('514993f5516c16499bb918f377a07a7988bc4c8771f916dafd3014a2f24a1a06')

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
