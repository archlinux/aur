# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Kars Wang <jaklsy AT gmail.com>

_author=CHANSEN
_dist=URL-Encode-XS
pkgname=perl-${_dist@L}
pkgver=0.03
pkgrel=2
pkgdesc='XS implementation of URL::Encode'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-exporter'
    'perl-url-encode>=0.03'
    'perl-xsloader'
    'perl>=5.8.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d44f416bd3e58e3b3366ab420705da02c7118fc848a97ce089366ea0461fa823')

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
