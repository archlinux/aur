# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=MATEU
_dist=MooX-Types-MooseLike-Numeric
pkgname=perl-${_dist@L}
pkgver=1.03
pkgrel=2
pkgdesc='Moo types for numbers'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-moox-types-mooselike>=0.23'
    'perl>=5.6.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-moo>=1.004002'
    'perl-test-fatal>=0.003'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('16adeb617b963d010179922c2e4e8762df77c75232e17320b459868c4970c44b')

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
