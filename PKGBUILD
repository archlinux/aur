# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=BOBTFISH
_dist=Catalyst-ActionRole-ACL
pkgname=perl-${_dist@L}
pkgver=0.07
pkgrel=3
pkgdesc='User role-based authorization action class'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-controller-actionrole'
    'perl-catalyst-runtime>=5.90013'
    'perl-moose'
    'perl-namespace-autoclean'
)
makedepends=(
    'perl-extutils-makemaker>=6.36'
    'perl-module-install'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('1af0fa5d6d38e8edf6b6c5349b69f03cc541b68d700aaf782196f4e3f2bbf816')

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
