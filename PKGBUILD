# Maintainer: Homer Xing <homer.hsing at gmail dot com>

_author=DCANTRELL
_dist=XML-Tiny
pkgname=perl-xml-tiny
pkgver=2.07
pkgrel=0
pkgdesc='simple lightweight parser for a subset of XML'
arch=('any')
url='https://metacpan.org/dist/XML-Tiny'
license=('Artistic-1.0-Perl OR GPL-2.0')
makedepends=('perl-extutils-makemaker')
depends=()
checkdepends=()
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/${_author}/${_dist}-${pkgver}.tar.gz")
sha256sums=('ce39fcb53e0fe9f1cbcd86ddf152e1db48566266b70ec0769ef364eeabdd8941')

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

