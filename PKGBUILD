# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=HAARG
_dist=MooseX-Emulate-Class-Accessor-Fast
pkgname=perl-${_dist@L}
pkgver=0.009032
pkgrel=2
pkgdesc='Emulate Class::Accessor::Fast behavior using Moose attributes'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-moose>=0.84'
    'perl-namespace-clean'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-exception'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('82eeb7ef1f0d25418ae406ea26912b241428d4b2ab9510d5e9deb3f72c187994')

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
