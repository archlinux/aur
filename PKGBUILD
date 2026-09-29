# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=MRAMBERG
_dist=Text-SimpleTable
pkgname=perl-${_dist@L}
pkgver=2.07
pkgrel=2
pkgdesc='Simple eyecandy ASCII tables'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-2.0')
depends=(
    'perl-extutils-makemaker'
    'perl-test-simple'
    'perl>=5.8.1'
)
optdepends=(
    'perl-text-visualwidth'
    'perl-text-visualwidth-pp'
    'perl-unicode-linebreak'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('256d3f38764e96333158b14ab18257b92f3155c60d658cafb80389f72f4619ed')

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
