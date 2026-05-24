# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=RYOSKZYPU
_dist=App-cpan2arch
pkgname=perl-${_dist@L}
pkgver=v1.1.1
pkgrel=1
pkgdesc='generate PKGBUILD from CPAN metadata'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('MIT-0')
depends=(
    'pacman'
    'perl-archive-tar'
    'perl-capture-tiny>=0.50'
    'perl-devel-checkbin>=0.04'
    'perl-io-socket-ssl>=2.098'
    'perl-list-compare>=0.55'
    'perl-module-corelist'
    'perl-mojolicious'
    'perl-object-pad>=0.825'
    'perl-path-tiny>=0.150'
    'perl-pathtools'
    'perl-pod-usage'
    'perl-scalar-list-utils'
    'perl-software-license>=0.104007'
    'perl-term-table'
    'perl-time-piece'
    'perl-version'
    'perl>=5.42.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-capture-tiny>=0.50'
    'perl-devel-checkbin>=0.04'
    'perl-path-tiny>=0.150'
    'perl-test-simple>=1.302217'
    'perl-text-diff>=1.45'
)
optdepends=(
    'licenses: use system licenses from /usr/share/licenses/spdx'
    'perl-chi>=0.61: caching support'
    'perl-cpanel-json-xs>=4.40: faster JSON serialization'
    'perl-data-printer>=1.002001: debug support'
    'perl-getopt-long-more>=0.007: Bash completion support'
    'perl-mojo-useragent-cached>=1.25: caching support'
    'perl-term-readkey>=2.38: set comparison table size based on TTY (--update)'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('6c87690ebe245728e264eb87f37868ad7bee71e66719b58f16e0cfb3138d9b34')

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
