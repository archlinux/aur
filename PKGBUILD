# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: BluePeril "<blueperil@blueperil.de>"

_author=MSTROUT
_dist=Test-WWW-Mechanize-Catalyst
pkgname=perl-${_dist@L}
pkgver=0.62
pkgrel=2
pkgdesc='Test::WWW::Mechanize for Catalyst'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-catalyst-runtime>=5.90'
    'perl-class-load>=0.19'
    'perl-libwww>=5.816'
    'perl-moose>=0.67'
    'perl-namespace-clean>=0.09'
    'perl-test-www-mechanize>=1.14'
    'perl-www-mechanize>=1.54'
    'perl>=5.8.4'
)
makedepends=(
    'perl-catalyst-plugin-session'
    'perl-catalyst-plugin-session-state-cookie'
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-test-exception'
    'perl-test-simple'
    'perl-test-utf8'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('183bde1ae7aba70dcb3ed777c5548237f42c3ed551fd5bc658cee86d0216acb1')

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
