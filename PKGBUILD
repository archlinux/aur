# Maintainer: Homer Xing <homer.hsing at gmail dot com>

_dist=App-Sqitch
pkgname=sqitch
pkgver=1.6.1
pkgrel=3
pkgdesc='Sensible database change management'
arch=('any')
url='https://github.com/sqitchers/sqitch'
license=('MIT')
makedepends=(
    'perl-extutils-makemaker'
    'perl-module-build'
)
depends=(
    perl-algorithm-backoff
    perl-clone
    perl-config-gitlike
    perl-dbi
    perl-datetime
    perl-datetime-timezone
    perl-devel-stacktrace
    perl-encode-locale
    perl-hash-merge
    perl-io-pager
    perl-ipc-run3
    perl-ipc-system-simple
    perl-list-moreutils
    perl-libintl-perl
    perl-moo
    perl-path-class
    perl-perlio-utf8-strict
    perl-pod-parser
    perl-throwable
    perl-string-formatter
    perl-string-shellquote
    perl-sub-exporter
    perl-template-tiny
    perl-throwable
    perl-try-tiny
    perl-type-tiny
    perl-uri
    perl-uri-db
    perl-xml-tiny
    perl-yaml-tiny
    perl-namespace-autoclean
)
optdepends=(
    perl-class-xsaccessor
    perl-template-toolkit
    perl-type-tiny-xs
)
checkdepends=(
    perl-capture-tiny
    perl-dbi
    perl-io-pager
    perl-module-runtime
    perl-path-class
    perl-test-deep
    perl-test-dir
    perl-test-exception
    perl-test-exit
    perl-test-file
    perl-test-file-contents
    perl-test-mockmodule
    perl-test-mockobject
    perl-test-nowarnings
    perl-test-warn
    perl-xml-tiny
    perl-yaml-tiny
)
options=(!emptydirs !purge)
source=("https://github.com/sqitchers/${pkgname}/releases/download/v${pkgver}/${_dist}-v${pkgver}.tar.gz")
sha256sums=('c82faf99128e5b3303ee3c8e85a3190f00bc91502e3919600ddc1f495f713474')

build()
{
    cd "${_dist}-v${pkgver}"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

    /usr/bin/perl Build.PL \
        --installdirs=vendor \
        --config installman1dir=/usr/share/man/man1 \
        --config installman3dir=/usr/share/man/man3 \
        --etcdir=/etc/sqitch \
        --no-packlist \
        --no-perllocal

    ./Build
}

check()
{
    cd "${_dist}-v${pkgver}"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "${_dist}-v${pkgver}"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --destdir="${pkgdir}"
}

