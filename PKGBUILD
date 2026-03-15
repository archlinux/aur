# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: camb

_author=RJBS
_dist=App-Cmd
pkgname=perl-${_dist@L}
pkgver=0.340
pkgrel=1
pkgdesc='write command line apps with less suffering'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-capture-tiny>=0.13'
    'perl-carp'
    'perl-class-load>=0.06'
    'perl-constant'
    'perl-data-optlist'
    'perl-experimental'
    'perl-getopt-long-descriptive>=0.117'
    'perl-getopt-long>=2.39'
    'perl-io-tiecombine'
    'perl-module-pluggable'
    'perl-parent'
    'perl-pod-usage>=1.61'
    'perl-string-rewriteprefix'
    'perl-sub-exporter'
    'perl-sub-install'
    'perl-text-abbrev'
    'perl>=5.20.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-data-dumper'
    'perl-extutils-makemaker'
    'perl-ipc-cmd'
    'perl-lib'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('bbee8cd6b31ee9c2a6e9a10f49416c438d343102f55c1b0e50d20e1bf5f4a82e')

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
