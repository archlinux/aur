# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=JKEENAN
_dist=Devel-NYTProf
pkgname=perl-${_dist@L}
pkgver=6.16
pkgrel=1
pkgdesc='Powerful fast feature-rich Perl source code profiler'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-file-which>=1.09'
    'perl-getopt-long'
    'perl-json-maybexs'
    'perl-scalar-list-utils'
    'perl-xsloader'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-capture-tiny'
    'perl-sub-name>=0.11'
    'perl-test-differences>=0.60'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c5553739fbcdf0699df47554fc5e32c4e68ca7876511eef7aceffb6db27badda')

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
