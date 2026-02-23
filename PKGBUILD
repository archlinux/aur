# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: eyecreate <eyecreate@gmail.com>

_dist='Graph-Easy'
pkgname='perl-graph-easy'
pkgver=0.76
pkgrel=4
pkgdesc='Convert or render graphs (as ASCII, HTML, SVG or via Graphviz)'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('custom')
depends=(
    'perl-scalar-list-utils'
    'perl>=5.8.2'
)
makedepends=(
    'perl-module-build>=0.36'
    'perl-test-simple'
)
optdepends=(
    'graphviz: Graphviz support'
    'perl-graph-easy-as_svg: SVG support'
)
source=("https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=('d4a2c10aebef663b598ea37f3aa3e3b752acf1fbbb961232c3dbe1155008d1fa')

build()
{
    cd $_dist-$pkgver

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
