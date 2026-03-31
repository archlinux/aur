# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=RJBS
_dist=Email-MIME-Kit
pkgname=perl-${_dist@L}
pkgver=3.000008
pkgrel=1
pkgdesc='build messages from templates'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-email-messageid>=1.400'
    'perl-email-mime'
    'perl-encode'
    'perl-json>=2'
    'perl-module-runtime'
    'perl-moose'
    'perl-pathtools'
    'perl-string-rewriteprefix'
    'perl-yaml-libyaml'
    'perl>=5.20.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-lib'
    'perl-pathtools'
    'perl-test-deep'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('39373e092a52f0bd75c216006f48567a141aeb51cfce3e26321d0c55fb72718c')

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
