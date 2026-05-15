# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=RYOSKZYPU
_dist=App-cpan2arch
pkgname=perl-${_dist@L}
pkgver=v1.0.1
pkgrel=1
pkgdesc='generate PKGBUILD from CPAN metadata'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('MIT-0')
depends=(
    'pacman'
    'perl-archive-tar'
    'perl-capture-tiny>=0.50'
    'perl-chi>=0.61'
    'perl-cpanel-json-xs>=4.40'
    'perl-devel-checkbin>=0.04'
    'perl-encode'
    'perl-encode-locale>=1.05'
    'perl-io-socket-ssl>=2.098'
    'perl-list-compare>=0.55'
    'perl-module-corelist>=5.20260420'
    'perl-mojo-useragent-cached>=1.25'
    'perl-mojolicious'
    'perl-object-pad>=0.825'
    'perl-path-tiny>=0.150'
    'perl-pathtools'
    'perl-pod-usage'
    'perl-scalar-list-utils'
    'perl-software-license>=0.104007'
    'perl-term-readkey>=2.38'
    'perl-term-table'
    'perl-time-piece'
    'perl-version>=0.9934'
    'perl>=5.42.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-capture-tiny>=0.50'
    'perl-devel-checkbin>=0.04'
    'perl-path-tiny>=0.150'
    'perl-test-simple'
    'perl-text-diff>=1.45'
)
optdepends=(
    'licenses: use system licenses from /usr/share/licenses/spdx'
    'perl-data-printer>=1.002001: debug support'
    'perl-getopt-long-more>=0.007: Bash completion support'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('693d8d64dc76f17f69be770ecfd5e1f542aaaf1bd4bcd15374ecb6d14f43bd3f')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
