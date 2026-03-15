# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=KARASIK
_dist=Crypt-Curve25519
pkgname=perl-${_dist@L}
pkgver=0.08
pkgrel=2
pkgdesc='Generate shared secret using elliptic-curve Diffie-Hellman function'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('custom:curve25519-donna')
depends=(
    'perl'
    'perl-carp'
    'perl-exporter'
    'perl-xsloader'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('42eb902b44e434abcdc636435739c4e439fd083fdd561fb005cfc5772c2d179e')

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
    install -Dm644 curve25519-donna-license.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
