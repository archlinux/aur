# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=RJBS
_dist=CPAN-Uploader
pkgname=perl-${_dist@L}
pkgver=0.103019
pkgrel=3
pkgdesc='upload things to the CPAN'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper'
    'perl-digest-md5'
    'perl-getopt-long-descriptive>=0.084'
    'perl-http-message'
    'perl-libwww'
    'perl-lwp-protocol-https>=1'
    'perl-pathtools'
    'perl-term-readkey'
    'perl>=5.12.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-file-temp'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.12.0'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f1adcb543d5a1ce59be08a25578125992c6dcf1d4888fd9ff658823b46922c24')

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
