# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=BOBTFISH
_dist=Task-Catalyst
pkgname=perl-${_dist@L}
pkgver=4.02
pkgrel=2
pkgdesc='All you need to start with Catalyst'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-action-rest'
    'perl-catalyst-actionrole-acl'
    'perl-catalyst-authentication-credential-http'
    'perl-catalyst-authentication-store-dbix-class'
    'perl-catalyst-component-instancepercontext'
    'perl-catalyst-controller-actionrole'
    'perl-catalyst-devel>=1.26'
    'perl-catalyst-manual>=5.80'
    'perl-catalyst-model-adaptor'
    'perl-catalyst-model-dbic-schema'
    'perl-catalyst-plugin-authentication'
    'perl-catalyst-plugin-configloader'
    'perl-catalyst-plugin-i18n'
    'perl-catalyst-plugin-session'
    'perl-catalyst-plugin-session-state-cookie'
    'perl-catalyst-plugin-session-store-dbic'
    'perl-catalyst-plugin-session-store-file'
    'perl-catalyst-plugin-stacktrace'
    'perl-catalyst-plugin-static-simple'
    'perl-catalyst-runtime'
    'perl-catalyst-view-email'
    'perl-catalyst-view-tt'
    'perl-catalystx-component-traits'
    'perl-catalystx-leakchecker'
    'perl-catalystx-profile'
    'perl-catalystx-repl'
    'perl-catalystx-simplelogin'
    'perl-fcgi'
    'perl-fcgi-procmanager'
    'perl-local-lib'
    'perl-starman'

)
makedepends=('perl-extutils-makemaker>=6.30')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9acd7b65fe09c4874aa72145ad341e66f0cac49c656e1a62f18206c615d9706d')

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
