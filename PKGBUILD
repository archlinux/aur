# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=HMBRAND
_dist=Spreadsheet-Read
pkgname=perl-${_dist@L}
pkgver=0.95
pkgrel=2
pkgdesc='Meta-Wrapper for reading spreadsheet data'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper'
    'perl-data-peek'
    'perl-encode'
    'perl-exporter'
    'perl-file-temp>=0.22'
    'perl-scalar-list-utils'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-harness'
    'perl-test-nowarnings'
    'perl-test-simple'
)
optdepends=('perl-io-stringy')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tgz")
sha256sums=('99fe77002189b6b90d9a2d502b9c597ac0beb57b4ad8531a356a5912db72107e')

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
