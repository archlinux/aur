# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com>
# Contributor: Gergan Penkov <gergan@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Oliver Charles <oliver.g.charles@googlemail.com>

_author=ARODLAND
_dist=FCGI-ProcManager
pkgname=perl-${_dist@L}
pkgver=0.28
pkgrel=2
pkgdesc='A perl-based FastCGI process manager'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('LGPL-2.1-or-later')
depends=('perl')
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e1c958c042427a175e051e0008f2025e8ec80613d3c7750597bf8e529b04420e')

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
