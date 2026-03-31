# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=THALJEF
_dist=Pinto
pkgname=perl-${_dist@L}
pkgver=0.14
pkgrel=1
pkgdesc='Curate a repository of Perl modules'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-app-cmd'
    'perl-archive-extract>=0.68'
    'perl-archive-tar'
    'perl-authen-simple-passwd'
    'perl-base'
    'perl-carp'
    'perl-class-load'
    'perl-cpan-checksums'
    'perl-cpan-distnameinfo'
    'perl-cpan-meta'
    'perl-cpan-meta-requirements'
    'perl-cwd-guard'
    'perl-datetime'
    'perl-datetime-timezone'
    'perl-dbd-sqlite>=1.33'
    'perl-dbix-class'
    'perl-devel-stacktrace'
    'perl-digest-md5'
    'perl-digest-sha'
    'perl-dist-metadata>=0.926'
    'perl-encode'
    'perl-exporter'
    'perl-file-homedir'
    'perl-file-nfslock'
    'perl-file-temp'
    'perl-file-which'
    'perl-getopt-long'
    'perl-http-date'
    'perl-http-message'
    'perl-io'
    'perl-io-interactive'
    'perl-io-prompt'
    'perl-io-string'
    'perl-io-zlib'
    'perl-json'
    'perl-json-pp>=2.27103'
    'perl-libwww'
    'perl-list-moreutils'
    'perl-module-corelist>=5.20170720'
    'perl-module-metadata>=1.000031'
    'perl-moose'
    'perl-moosex-aliases'
    'perl-moosex-classattribute>=0.27'
    'perl-moosex-configuration'
    'perl-moosex-markasmethods'
    'perl-moosex-nonmoose'
    'perl-moosex-setonce'
    'perl-moosex-strictconstructor'
    'perl-moosex-types'
    'perl-path-class'
    'perl-pathtools'
    'perl-plack'
    'perl-pod-usage'
    'perl-proc-fork'
    'perl-proc-terminator'
    'perl-readonly'
    'perl-router-simple'
    'perl-scalar-list-utils'
    'perl-starman>=0.3014'
    'perl-string-format'
    'perl-term-ansicolor>=2.02'
    'perl-throwable>=0.200005'
    'perl-try-tiny'
    'perl-uri'
    'perl-uuid-tiny'
    'perl-variable-magic>=0.57'
    'perl-version'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker>=6.64')
checkdepends=(
    'perl-apache-htpasswd'
    'perl-capture-tiny'
    'perl-extutils-makemaker'
    'perl-file-temp'
    'perl-findbin'
    'perl-http-body'
    'perl-http-message'
    'perl-io'
    'perl-lib'
    'perl-module-faker>=0.014'
    'perl-pathtools'
    'perl-plack'
    'perl-test-exception'
    'perl-test-file'
    'perl-test-lwp-useragent>=0.018'
    'perl-test-simple'
    'perl-test-tcp'
    'perl>=5.8.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f8c4546491a091e55f58a32163bc38b66e550a99a67bf8bc9bf7f8ad3b3b6220')

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
