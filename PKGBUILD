# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Milo Mirate <mmirate@gatech.edu>

_author=VOJ
_dist=RDF-NS
pkgname=perl-${_dist@L}
pkgver=20230619
pkgrel=1
pkgdesc='quickly get common URI namespaces'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-sharedir>=1.00'
    'perl>=5.12.0'
)
makedepends=('perl-module-build-tiny>=0.035')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('5856312dfda8852b10e9354b9565f506c1ff284e9c2349c9cb2d6d821bc66a5d')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
