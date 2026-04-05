# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com> 
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=BOBTFISH
_dist=Catalyst-Plugin-I18N
pkgname=perl-${_dist@L}
pkgver=0.10
pkgrel=4
pkgdesc='I18N for Catalyst'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-catalyst-runtime'
    'perl-locale-maketext-lexicon'
    'perl-locale-maketext-simple>=0.19'
    'perl-mro-compat>=0.10'
    'perl-test-simple'
    'perl>=5.8.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.42'
    'perl-module-install'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f6039bdb2894b200ee379e4a69ea9bd9ce37611c64738d2e7b94bb05ad75399c')

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
