# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=Complete-Getopt-Long
pkgname=perl-${_dist@L}
pkgver=0.481
pkgrel=1
pkgdesc='Complete command-line argument using Getopt::Long specification'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-complete-env'
    'perl-complete-file>=0.440'
    'perl-complete-util>=0.608'
    'perl-exporter>=5.57'
    'perl-getopt-long-util>=0.896'
    'perl-log-ger>=0.038'
    'perl-string-wildcard-bash>=0.044'
    'perl>=5.10.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-complete-bash>=0.333'
    'perl-file-chdir'
    'perl-file-temp>=0.2307'
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=('perl-unix-passwd-file')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('6fc2ca7c3a3725b4eae65c6fae1f97362cf676799b8d4f2257d5675a44da135c')

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
