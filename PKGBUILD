# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=FLORA
_dist=Catalyst-Plugin-Session-Store-File
pkgname=perl-${_dist@L}
pkgver=0.18
pkgrel=2
pkgdesc='File storage backend for session data.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-cache-cache>=1.02'
    'perl-catalyst-plugin-session>=0.27'
    'perl-catalyst-runtime>=5.7000'
    'perl-class-data-inheritable>=0.04'
    'perl-mro-compat>=0.10'
    'perl>=5.8.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.42'
    'perl-module-install'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('54738e3ce76f8be8b66947092d28973c73d79d1ee19b5d92b057552f8ff09b4f')

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
