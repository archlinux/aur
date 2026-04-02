# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ABRAXXA
_dist=CatalystX-SimpleLogin
pkgname=perl-${_dist@L}
pkgver=0.21
pkgrel=1
pkgdesc='Provide a simple Login controller which can be reused'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-action-rest>=0.74'
    'perl-catalyst-plugin-authentication'
    'perl-catalyst-plugin-session>=0.35'
    'perl-catalyst-runtime>=5.80013'
    'perl-catalyst-view-tt'
    'perl-catalystx-component-traits>=0.13'
    'perl-catalystx-injectcomponent'
    'perl-html-formhandler>=0.28001'
    'perl-moose'
    'perl-moosex-methodattributes>=0.18'
    'perl-moosex-relatedclassroles>=0.004'
    'perl-moosex-types'
    'perl-moosex-types-common'
    'perl-namespace-autoclean'
    'perl-try-tiny>=0.24'
)
makedepends=(
    'perl-catalyst-action-renderview'
    'perl-catalyst-actionrole-acl'
    'perl-catalyst-plugin-session-state-cookie'
    'perl-class-load>=0.20'
    'perl-extutils-makemaker>=6.36'
    'perl-file-temp'
    'perl-http-message'
    'perl-module-install'
    'perl-sql-translator'
    'perl-test-exception'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('6ccf97c824c7737572f535fd4a590bd3fe9ea5e12eaa6beffbef4b179b11b89d')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
