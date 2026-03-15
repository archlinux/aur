# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=IKEGAMI
_dist=DateTime-Format-RFC3339
pkgname=perl-${_dist@L}
pkgver=v1.10.0
pkgrel=4
pkgdesc='Parse and format RFC3339 datetime strings'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('CC0-1.0')
depends=(
    'perl-datetime'
    'perl-version'
    'perl>=5.10.0'
)
makedepends=('perl-extutils-makemaker>=6.74')
checkdepends=('perl-test-simple')
optdepends=('perl-test-pod')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('3a5e64e7beaafd2c64a12109e3cc0fed3db3f893b0323b43b52964fc2c0c8496')

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

