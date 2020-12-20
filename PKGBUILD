# Maintainer: Berto Gomez <csberto at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bruno Dupuis <lisael@lisael.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

pkgname=perl-app-sqitch
pkgver=1.1.0
pkgrel=4
pkgdesc='Sane database change management'
_dist=App-Sqitch
arch=('any')
url="https://sqitch.org/"
license=('MIT')
depends=(
    'perl-clone'
    'perl-datetime'
    'perl-datetime-timezone'
    'perl-dbi'
    'perl-devel-stacktrace'
    'perl-encode-locale'
    'perl-file-homedir'
    'perl-hash-merge'
    'perl-libintl-perl'
    'perl-io-pager'
    'perl-ipc-run3'
    'perl-ipc-system-simple'
    'perl-list-moreutils'
    'perl-moo>=1.002000'
    'perl-namespace-autoclean>=0.16'
    'perl-path-class>=0.33'
    'perl-perlio-utf8-strict'
    'perl-string-formatter'
    'perl-string-shellquote'
    'perl-sub-exporter'
    'perl-template-tiny'
    'perl-throwable>=0.200009'
    'perl-try-tiny'
    'perl-type-tiny'
    'perl-type-tiny-xs'
    'perl-uri-db'
    'perl-uri'
    'perl>=5.11.0'
    'perl-module-install'
)

checkdepends=(
    'perl-config-gitlike'
    'perl-test-warn'
    'perl-test-mockobject'
    'perl-capture-tiny'
    'perl-test-deep'
    'perl-test-file'
    'perl-test-mockmodule'
    'perl-test-nowarnings'
    'perl-test-dir'
    'perl-test-file-contents'
    'perl-test-exception'
    'perl-pod-parser'
)

optdepends=(
    'perl-dbd-pg: PostgreSQL support'
    'perl-dbd-sqlite: SQLite support'
    'perl-dbd-mysql: MySQL support'
)

options=('!emptydirs' purge)
source=("https://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/$_dist-v$pkgver.tar.gz")
sha512sums=('bb2d179c473d2c659fa0e6b23a5c312449299975a2e487f84812d9d891ecc139278da1661e1a4eb922487b0cafb8014de019b498c069799f39fd2e31392cf3aa')

build() {
    cd "$srcdir/$_dist-v$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
    /usr/bin/perl Build.PL
    ./Build installdeps # this step missing in script, but it cannot be passed automatically
    ./Build
}

check() {
    cd "$srcdir/$_dist-v$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    ./Build test
}

package() {
    cd "$srcdir/$_dist-v$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
