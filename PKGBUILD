# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=MSTROUT
_dist=Web-Simple
pkgname=perl-${_dist@L}
pkgver=0.033
pkgrel=1
pkgdesc='A quick and easy way to build simple web applications'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-encode'
    'perl-exporter>=5.57'
    'perl-http-body>=1.22'
    'perl-moo>=0.009014'
    'perl-plack>=0.9968'
    'perl-scalar-list-utils'
    'perl-strictures>=1'
    'perl-syntax-keyword-gather>=1.001'
    'perl-warnings-illegalproto'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-data-dumper-concise>=2.020'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('dd9d610885579a1ad6eed02b9b2d590ae2c9614c92fd32aa3c7dc4ae0dd062d5')

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
