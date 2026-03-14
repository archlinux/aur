# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Celti Burroughs <celti@celti.name>

_author=JBAIER
_dist=Pass-OTP
_ver=1.801
pkgname=perl-${_dist@L}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='Perl implementation of HOTP / TOTP algorithms'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-digest-hmac'
    'perl-digest-sha'
    'perl-math-bigint>=1.999806'
    'perl-mime-base32'
    'perl>=5.14.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$_ver.tar.gz")
sha256sums=('2f4b892917d55ccff32c7a9c8be7ecd6ab9efec2c0d164cfefa0e1e0b4830bba')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
