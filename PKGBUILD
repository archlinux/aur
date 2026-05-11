# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=RJBS
_dist=Dist-Zilla
pkgname=perl-${_dist@L}
pkgver=6.037
pkgrel=2
pkgdesc='distribution builder; installer not included!'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-app-cmd'
    'perl-archive-tar'
    'perl-autodie'
    'perl-carp'
    'perl-config-ini'
    'perl-config-mvp'
    'perl-config-mvp-reader-ini>=2.101461'
    'perl-cpan-meta'
    'perl-cpan-meta-requirements>=2.121'
    'perl-cpan-uploader>=0.103004'
    'perl-data-dumper'
    'perl-data-section>=0.200002'
    'perl-datetime>=0.44'
    'perl-digest-md5'
    'perl-encode'
    'perl-experimental'
    'perl-extutils-manifest>=1.66'
    'perl-file-copy-recursive>=0.41'
    'perl-file-find-rule'
    'perl-file-path'
    'perl-file-pushd'
    'perl-file-sharedir'
    'perl-file-sharedir-install>=0.03'
    'perl-file-temp'
    'perl-json-maybexs'
    'perl-log-dispatchouli>=1.102220'
    'perl-mixin-linewise>=0.100'
    'perl-module-corelist'
    'perl-module-runtime'
    'perl-moose'
    'perl-moosex-lazyrequire'
    'perl-moosex-role-parameterized>=1.01'
    'perl-moosex-setonce'
    'perl-moosex-types'
    'perl-moosex-types-perl'
    'perl-namespace-autoclean'
    'perl-params-util'
    'perl-parent'
    'perl-path-tiny>=0.052'
    'perl-pathtools'
    'perl-perl-prereqscanner>=1.016'
    'perl-pod-simple'
    'perl-ppi>=1.222'
    'perl-scalar-list-utils'
    'perl-software-license'
    'perl-string-formatter>=0.100680'
    'perl-string-rewriteprefix>=0.006'
    'perl-sub-exporter'
    'perl-sub-exporter-formethods'
    'perl-term-ansicolor>=5.00'
    'perl-term-encoding'
    'perl-term-readkey'
    'perl-term-readline'
    'perl-term-ui'
    'perl-test-deep'
    'perl-text-glob>=0.08'
    'perl-text-template'
    'perl-try-tiny'
    'perl-version'
    'perl-yaml-tiny'
    'perl>=5.20.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-cpan-meta-check>=0.011'
    'perl-cpan-meta-requirements>=2.121'
    'perl-extutils-makemaker'
    'perl-extutils-manifest>=1.66'
    'perl-lib'
    'perl-pathtools'
    'perl-software-license'
    'perl-test-failwarnings'
    'perl-test-fatal'
    'perl-test-file-sharedir'
    'perl-test-simple'
)
optdepends=(
    'cpanminus'
    'perl-cpan-meta>=2.120900'
    'perl-data-optlist>=0.110'
    'perl-ppi-xs'
    'perl-term-readline-gnu'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('8c90db44bf09b11041761528edafb821669c87c154a757dd470608545a7dc75e')

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
