# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=Complete-Bash
pkgname=perl-${_dist@L}
pkgver=0.337
pkgrel=1
pkgdesc='Completion routines for bash shell'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-exporter>=5.57'
    'perl-log-ger>=0.038'
    'perl>=5.10.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-exception'
    'perl-test-simple'
)
optdepends=(
    'perl-file-which'
    'perl-term-size'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9263ee9eff9e32156e9beff19f68f3d5e63018833d75bd229892939993ea3ce4')

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
