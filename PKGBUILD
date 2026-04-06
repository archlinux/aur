# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=MIYAGAWA
_dist=Plack-Middleware-MethodOverride
pkgname=perl-${_dist@L}
pkgver=0.20
pkgrel=2
pkgdesc='Override REST methods to Plack apps via POST'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-parent'
    'perl-plack'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-plack'
    'perl-test-simple'
    'perl-uri'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('dbfb5a2efb48bfeb01cb3ae1e1c677e155dc7bfe210c7e7f221bae3cb6aab5f1')

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
