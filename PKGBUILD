# Maintainer: Homer Xing <homer.hsing at gmail dot com>
# Contributor: Bruno Dupuis <lisael@lisael.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

_author=MTHURN
_dist=Test-Dir
pkgname=perl-test-dir
pkgver=1.16
pkgrel=2
pkgdesc='test directory attributes'
arch=('any')
url='https://metacpan.org/dist/Test-Dir'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
makedepends=('perl-extutils-makemaker')
depends=('perl-test-simple')
checkdepends=()
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/${_author}/${_dist}-${pkgver}.tar.gz")
sha256sums=('7332b323913eb6a2684d094755196304b2f8606f70eaab913654ca91f273eac2')

build()
{
    cd "${_dist}-${pkgver}"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "${_dist}-${pkgver}"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "${_dist}-${pkgver}"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

