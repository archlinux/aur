# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=ETHER
_dist=Devel-REPL
pkgname=perl-${_dist@L}
pkgver=1.003029
pkgrel=5
pkgdesc='A modern perl interactive shell'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-module-runtime'
    'perl-moose'
    'perl-moosex-getopt>=0.18'
    'perl-moosex-object-pluggable>=0.0009'
    'perl-namespace-autoclean'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-task-weaken'
    'perl-term-ansicolor'
    'perl-term-readline'
    'perl-time-hires'
    'perl>=5.8.1'

    # Optional plugins are declared in depends to avoid runtime errors.
    # See https://rt.cpan.org/Public/Bug/Display.html?id=89531.
    'perl-app-nopaste'
    'perl-b-keywords'
    'perl-data-dump-streamer>=2.39'
    'perl-data-dumper-concise'
    'perl-file-next'
    'perl-lexical-persistence'
    'perl-module-refresh'
    'perl-ppi'
    'perl-sys-sigaction'
)
makedepends=(
    # CPAN::Meta::Requirements got split out from CPAN::Meta in 2.120921.
    #'perl-cpan-meta-requirements>=2.120620'
    'perl-cpan-meta-requirements'

    'perl-extutils-makemaker'
    'perl-module-metadata'
)
checkdepends=(
    'perl-extutils-makemaker'
    'perl-if'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
    'perl>=5.8.1'
)
optdepends=(
    'perl-cpan-meta>=2.120900'
    'perl-ppi-xs>=0.902'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('7c87ebd88fe3abab2ff8c3fb681c6446ee7a2dc1390a6df7aa604f2634473c69')

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
