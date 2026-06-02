# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=OALDERS
_dist=TOML-Tiny
pkgname=perl-${_dist@L}
pkgver=0.21
pkgrel=2
pkgdesc='a minimal, pure perl TOML parser and serializer'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper'
    'perl-datetime-format-iso8601'
    'perl-datetime-format-rfc3339'
    'perl-encode'
    'perl-exporter'
    'perl-math-bigint>=1.999718'
    'perl>=5.18.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-data-dumper'
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
    'perl-types-serialiser'
)
optdepends=(
    'perl-cpan-meta>=2.120900'
    'perl-types-serialiser'
    'perl-unicode-linebreak'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('be79c165c8b5c416faa267a64032945114b51e80727738451ec1586ad4b0d29c')

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
