# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=HMBRAND
_dist=Data-Peek
pkgname=perl-${_dist@L}
pkgver=0.54
pkgrel=1
pkgdesc='Modified and extended debugging facilities'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-data-dumper'
    'perl-xsloader'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-simple'
    'perl-test-warnings'
)
optdepends=('perl-tidy')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4dbf2205d43fb7d963ba29902cd563a5ea6c3c6bb49a9493c40ce8b0f8572980')

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
