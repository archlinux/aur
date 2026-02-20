# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Sergey Konoplev <gray.ru@gmail.com>
# Contributor: Maxim Polishchuck <mpolishchuck@gmail.com>

_dist='App-FatPacker'
pkgname='perl-app-fatpacker'
pkgver=0.010008
pkgrel=1
pkgdesc='pack your dependencies onto your script file'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-path'
    'perl-getopt-long'
    'perl-pathtools'
    'perl>=5.8.0'
)
checkdepends=(
    'perl-file-temp'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MS/MSTROUT/$_dist-$pkgver.tar.gz")
sha256sums=('129db36dc845661a582286810cfe2d5216eb2ce082bad40ae1fcdce0f45deccf')

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
