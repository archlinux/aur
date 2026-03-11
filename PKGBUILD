# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: camb

_dist=App-Cmd
_ver=0.339
pkgname=perl-${_dist,,}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='write command line apps with less suffering'
arch=('any')
url=https://metacpan.org/release/RJBS/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-capture-tiny>=0.13'
    'perl-carp'
    'perl-class-load>=0.06'
    'perl-constant'
    'perl-data-optlist'
    'perl-experimental'
    'perl-getopt-long-descriptive>=0.116'
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
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/$_dist-$_ver.tar.gz")
sha256sums=('4508c7e533a1fd8a222261461834c1f87b6331c6b2f9932756a22bd2c3ecda51')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
