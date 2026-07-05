# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: baest <m at frausing dot me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SKAJI
_dist=App-cpm
pkgname=perl-${_dist@L}
pkgver=v1.1.4
pkgrel=1
epoch=1
pkgdesc='a fast CPAN module installer'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-command-runner>=v1.0.0'
    'perl-cpan-02packages-search>=v1.0.0'
    'perl-cpan-distnameinfo'
    'perl-darwin-initobjc>=v1.0.0'
    'perl-extutils-config'
    'perl-extutils-helpers'
    'perl-extutils-install>=2.20'
    'perl-extutils-installpaths>=0.002'
    'perl-file-copy-recursive'
    'perl-file-pushd'
    'perl-file-which'
    'perl-http-tinyish>=0.12'
    'perl-ipc-run3'
    'perl-module-cpanfile'
    'perl-module-cpmfile>=v1.0.0'
    'perl-parallel-pipes>=v1.0.0'
    'perl-parse-localdistribution>=0.20'
    'perl-proc-forksafe>=v1.0.0'
    'perl>=5.24.0'
)
makedepends=('perl-module-build-tiny>=0.053')
optdepends=('perl-carton')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('97b13d3257f72991d2b056dfc0e30806f66c1a5b487ec0236e21f23617b6eabf')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
