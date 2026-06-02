# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=GWILLIAMS
_dist=IRI
pkgname=perl-${_dist@L}
pkgver=0.014
pkgrel=1
pkgdesc='Internationalized Resource Identifiers'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-moo'
    'perl-moox-handlesvia'
    'perl-type-tiny>=0.008'
    'perl>=5.10.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-test-simple'
    'perl-try-tiny'
    'perl-uri'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e8788b16e2ddbd431a25099be44f9a8b82365c38faf66619d547d889b30c15d6')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
