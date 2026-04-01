# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ASH
_dist=WWW-Mechanize-TreeBuilder
pkgname=perl-${_dist@L}
pkgver=1.20000
pkgrel=1
pkgdesc='combine WWW::Mechanize and HTML::TreeBuilder in nice ways'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-html-tree'
    'perl-moose>=2.1200'
    'perl-moosex-role-parameterized'
    'perl-scalar-list-utils'
    'perl>=5.8.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-test-simple'
    'perl-test-www-mechanize'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2c88da07515afa87840ee3f9cbeab85d160f624bc23fd9c7d5eeff9acb57cf89')

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
