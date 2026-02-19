# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='TOML-Tiny'
pkgname='perl-toml-tiny'
pkgver=0.20
pkgrel=3
pkgdesc='a minimal, pure perl TOML parser and serializer'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper'
    'perl-encode'
    'perl-exporter'
    'perl-math-bigint>=1.999718'
    'perl>=5.18'
)
checkdepends=(
    'perl-data-dumper'
    'perl-datetime-format-iso8601'
    'perl-datetime-format-rfc3339'
    'perl-pathtools'
    'perl-test-pod'
    'perl-test-simple'
    'perl-toml-parser'
)
optdepends=(
    'perl-types-serialiser: boolean support'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/$_dist-$pkgver.tar.gz")
sha256sums=('9ae765a96205b3d74fb5c4f222713cf8256592c9815139b7a5474c8a3dfa13bc')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
