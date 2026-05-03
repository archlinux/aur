# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=RJBS
_dist=MooseX-Types-Perl
pkgname=perl-${_dist@L}
pkgver=0.101344
pkgrel=2
pkgdesc='Moose types that check against Perl syntax'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-moosex-types'
    'perl-params-util'
    'perl-version>=0.82'
    'perl>=5.12.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('87644354f74fa65235cb2bfca44277930a7eabe51acc5f81fb631530a8355e24')

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
