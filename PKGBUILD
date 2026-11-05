# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

_author=DJERIUS
_dist=Expect-Simple
pkgname=perl-${_dist@L}
pkgver=0.04
pkgrel=4
pkgdesc='wrapper around the Expect module'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('GPL-2.0-or-later')
depends=(
    'perl'
    'perl-expect'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('af83b92185e642695913ff138efe819752e80857759996deafcaab2700ad5db5')

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
