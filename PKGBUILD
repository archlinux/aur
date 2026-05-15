# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=Complete-File
pkgname=perl-${_dist@L}
pkgver=0.443
pkgrel=1
pkgdesc='Completion routines related to files'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-complete-common>=0.22'
    'perl-complete-path>=0.251'
    'perl-complete-util>=0.608'
    'perl-encode'
    'perl-exporter>=5.57'
    'perl>=5.10.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-file-chdir'
    'perl-file-temp>=0.2307'
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4a392ad3b5802c076edb0e07769f52f8a394d6718ebbd8a3f49997866f197304')

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
