# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SHLOMIF
_dist=Math-GMP
pkgname=perl-${_dist@L}
pkgver=2.25
pkgrel=2
pkgdesc='High speed arbitrary size integer math'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('LGPL-2.0-or-later')
depends=(
    'perl-autoloader'
    'perl-carp'
    'perl-exporter'
    'perl>=5.10.0'
)
makedepends=(
    'perl-alien-gmp>=1.08'
    'perl-extutils-makemaker'
)
checkdepends=(
    'perl-data-dumper'
    'perl-file-temp'
    'perl-io'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('382b71e54762f639e9a42a9b06934151987ba57d11bb70d35e3bec88d50450ce')

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
