# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Crypt-Curve25519'
pkgname='perl-crypt-curve25519'
pkgver=0.08
pkgrel=1
pkgdesc='Generate shared secret using elliptic-curve Diffie-Hellman function'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-exporter'
    'perl-xsloader'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/K/KA/KARASIK/$_dist-$pkgver.tar.gz")
sha256sums=('42eb902b44e434abcdc636435739c4e439fd083fdd561fb005cfc5772c2d179e')

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
