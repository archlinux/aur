# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_dist=Data-Dump-Streamer
_ver=2.42
pkgname=perl-${_dist,,}
pkgver=${_ver#v}
pkgrel=4
pkgdesc='Accurately serialize a data structure as Perl code.'
arch=('x86_64')  # XS modules might depend on external libs, so manual inspection is advised.
url=https://metacpan.org/release/YVES/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-b-utils'
    'perl-data-dumper'
    'perl-exporter'
    'perl-io'
    'perl-text-abbrev'
    'perl-text-balanced'
)
makedepends=(
    'perl-base'
    'perl-carp'
    'perl-data-dumper'
    'perl-extutils-cbuilder'
    'perl-extutils-depends'
    'perl-module-build'
    'perl-test-simple'
    'perl-text-abbrev'
    'perl>=5.6.0'
)
optdepends=(
    'perl-algorithm-diff'
    'perl-cpanel-json-xs'
    'perl-io-compress'
    'perl-mime-base64'
    'perl-padwalker'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Y/YV/YVES/$_dist-$_ver.tar.gz")
sha256sums=('47f6e51fb45ce7be561e01481add0c2e1c0cd85df4b9e212f3923cd3064d1cad')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
