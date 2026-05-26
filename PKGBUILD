# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Contributor: camb

_author=CROMEDOME
_dist=Dancer2
pkgname=perl-${_dist@L}
pkgver=2.1.0
pkgrel=1
pkgdesc='Lightweight yet powerful web application framework'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-attribute-handlers'
    'perl-carp'
    'perl-cli-osprey'
    'perl-clone'
    'perl-config-any'
    'perl-data-censor>=0.04'
    'perl-digest-sha'
    'perl-encode'
    'perl-exporter-tiny'
    'perl-exporter>=5.57'
    'perl-file-path'
    'perl-file-share'
    'perl-file-temp'
    'perl-file-which'
    'perl-hash-merge-simple'
    'perl-hash-multivalue'
    'perl-http-date'
    'perl-http-headers-fast>=0.21'
    'perl-http-tiny'
    'perl-import-into'
    'perl-json-maybexs'
    'perl-mime-base64>=3.13'
    'perl-module-pluggable'
    'perl-module-runtime'
    'perl-moo'
    'perl-parent'
    'perl-path-tiny'
    'perl-plack-middleware-fixmissingbodyinredirect'
    'perl-plack-middleware-removeredundantbody'
    'perl-plack>=1.0040'
    'perl-ref-util'
    'perl-role-tiny>=2.000000'
    'perl-safe-isa'
    'perl-scalar-list-utils'
    'perl-sub-quote'
    'perl-template-tiny>=1.16'
    'perl-template-toolkit'
    'perl-test-simple'
    'perl-type-tiny'
    'perl-uri'
    'perl-yaml>=0.86'
    'perl>=5.14.0'
)
makedepends=(
    'perl-cpan-meta-requirements'
    'perl-extutils-makemaker'
    'perl-file-sharedir-install>=0.06'
    'perl-module-metadata'
)
checkdepends=(
    'perl-capture-tiny>=0.12'
    'perl-extutils-makemaker'
    'perl-http-cookies'
    'perl-http-message'
    'perl-io'
    'perl-pathtools'
    'perl-pod-simple'
    'perl-template-toolkit'
    'perl-test-eol'
    'perl-test-exception'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=(
    'perl-cgi-deurl-xs'
    'perl-class-xsaccessor'
    'perl-cpan-meta>=2.120900'
    'perl-cpanel-json-xs'
    'perl-crypt-urandom'
    'perl-http-xscookies>=0.000015'
    'perl-http-xsheaders'
    'perl-math-random-isaac-xs'
    'perl-mime-types'
    'perl-moox-typetiny'
    'perl-pod-simple'
    'perl-type-tiny-xs'
    'perl-unicode-utf8'
    'perl-url-encode-xs'
    'perl-yaml-libyaml'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('8a4d73bc9b0cee9ad01603c432349ff1584c7d9ddfb7b0bcf50f2d9066b2e98f')

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
