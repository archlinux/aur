# Maintainer: Homer Xing <homer.hsing at gmail dot com>
# Contributor: Flakebi <flakebi@t-online.de>

_author=EXODIST
_dist=Test-Simple
pkgname=perl-test-simple
pkgver=1.302222
pkgrel=1
pkgdesc='Backend for building test libraries'
arch=('any')
url='https://metacpan.org/dist/Test-Simple'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
makedepends=('perl-extutils-makemaker')
depends=('perl')
checkdepends=()
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/${_author}/${_dist}-${pkgver}.tar.gz")
sha256sums=('7cf84a18d6c9450e53ae8b4de5d5fa32c9fe99f3cebbe408fe59433f19921ec2')

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

