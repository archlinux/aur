# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Celti Burroughs <celti@celti.name>

_author=JBAIER
_dist=Pass-OTP
pkgname=perl-${_dist@L}
pkgver=1.901
pkgrel=1
pkgdesc='Perl implementation of HOTP / TOTP algorithms'
arch=('any')
url=https://metacpan.org/dist/$_dist
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
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e5c98c755475d0d8327f7c2d9ae93e9ba7ee3846b3a1c93f402bd8030a9152a8')

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
