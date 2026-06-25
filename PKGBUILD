# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=RIBASUSHI
_dist=SQL-Abstract-Classic
pkgname=perl-${_dist@L}
pkgver=1.91
pkgrel=3
pkgdesc='Generate SQL from Perl data structures'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-exporter>=5.57'
    'perl-mro-compat>=0.12'
    'perl-scalar-list-utils'
    'perl-sql-abstract>=1.79'
    'perl-text-balanced>=2.00'
    'perl>=5.6.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-storable'
    'perl-test-deep>=0.101'
    'perl-test-exception>=0.31'
    'perl-test-simple'
    'perl-test-warn'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4e3d1dfd095b2123268586bb06b86929ea571388d4e941acccbdcda1e108ef28')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
