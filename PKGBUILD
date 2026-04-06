# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=PETDANCE
_dist=Template-Timer
pkgname=perl-${_dist@L}
pkgver=1.00
pkgrel=5
pkgdesc='Rudimentary profiling for Template Toolkit'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-2.0')
depends=(
    'perl'
    'perl-template-toolkit'
    'perl-test-simple'
    'perl-time-hires'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b7314cb365209d93557b8054e0311ae8c3cb5d1c9d228d1eb3e3fc193a5b77b4')

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
