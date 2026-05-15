# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=Getopt-Long-More
pkgname=perl-${_dist@L}
pkgver=0.007
pkgrel=1
pkgdesc='Like Getopt::Long, but with more stuffs'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp>=1.12'
    'perl-complete-bash>=0.333'
    'perl-complete-fish'
    'perl-complete-getopt-long>=0.475'
    'perl-complete-tcsh'
    'perl-complete-util>=0.608'
    'perl-complete-zsh'
    'perl-exporter>=5.57'
    'perl-getopt-long>=2.50'
    'perl-scalar-list-utils'
    'perl-text-parsewords'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-exception'
    'perl-test-simple'
    'perl-test-warn'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('aeef47c28c4a11364281c452da8afc1b7348632c75fa35f30019bb96ff081c60')

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
