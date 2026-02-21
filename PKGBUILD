# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_dist='Git-Wrapper'
pkgname='perl-git-wrapper'
pkgver='0.048'
pkgrel='2'
pkgdesc='Wrap git(7) command-line interface'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'git'
    'perl-file-chdir'
    'perl-file-temp'
    'perl-ipc-cmd'
    'perl-scalar-list-utils'
    'perl-sort-versions'
    'perl>=5.6.0'
)
makedepends=(
    'perl-devel-checkbin'
    'perl-pathtools'
)
checkdepends=(
    'perl-file-path'
    'perl-file-temp'
    'perl-io'
    'perl-path-class>=0.26'
    'perl-pathtools'
    'perl-sort-versions'
    'perl-test-deep'
    'perl-test-exception'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/G/GE/GENEHACK/$_dist-$pkgver.tar.gz")
sha256sums=('9e3bff7486193fa7e4c80774aa175188ff75a71d558ecc06501ddab24c45188d')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
