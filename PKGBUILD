# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=File-Flock-Retry
pkgname=perl-${_dist@L}
pkgver=0.632
pkgrel=1
pkgdesc='Yet another flock module'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.10.1')
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-file-chdir'
    'perl-file-slurper'
    'perl-file-temp>=0.2307'
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c60e9445e49be53988b86859834381beb393ca67c5b40ceb49df1d7ab998aca4')

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
