# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Milo Mirate <mmirate@gatech.edu>

_author=ARISTOTLE
_dist=Lingua-EN-Titlecase-Simple
pkgname=perl-${_dist@L}
pkgver=1.015
pkgrel=1
pkgdesc=$'John Gruber\'s headline capitalization script'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('MIT')
depends=('perl>=5.8.1')
checkdepends=(
    'perl-data-dumper'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('74555c28d16a2dc81d87cda5a82a0f7bec69f402959177b6a18fe6e91fa1f692')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
