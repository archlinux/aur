# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=ETHER
_dist=Catalyst-Plugin-Authentication
pkgname=perl-${_dist@L}
pkgver=0.10026
pkgrel=1
pkgdesc='Infrastructure plugin for the Catalyst authentication framework.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-runtime'
    'perl-moose'
    'perl-moosex-emulate-class-accessor-fast'
    'perl-mro-compat'
    'perl-namespace-autoclean'
    'perl-string-rewriteprefix'
    'perl-try-tiny'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-fatal'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('fed60a17b3ad3e7a5a65284a1444ecc33d9aacb94f7cd740a166fc9a236b625d')

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
