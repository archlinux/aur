# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=MIYAGAWA
_dist=Archive-Any-Create
pkgname=perl-${_dist@L}
pkgver=0.03
pkgrel=1
pkgdesc='Abstract API to create archives (tar.gz and zip)'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-archive-tar'
    'perl-archive-zip'
    'perl-exception-class'
    'perl-io-zlib'
    'perl-universal-require'
)
makedepends=('perl-extutils-makemaker>=6.30')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('bdd18e6427559e489041c6e3d71cf91ff5b53d294264c232b1c58773c0f3c678')

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
