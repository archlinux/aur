# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DHOSS
_dist=Catalyst-View-Email
pkgname=perl-${_dist@L}
pkgver=0.36
pkgrel=1
pkgdesc='Send Email from Catalyst'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-authen-sasl>=2.13'
    'perl-catalyst-runtime>=5.7'
    'perl-email-mime>=1.455'
    'perl-email-sender>=0.100110'
    'perl-mime-base64>=3.08'
    'perl-module-runtime>=0.014'
    'perl-moose>=0.93'
    'perl-parent>=0.223'
    'perl-test-simple'
)
makedepends=(
    'perl-extutils-makemaker>=6.36'
    'perl-module-install'
    'perl-test-requires'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('837211a96098cec16698ff09b135b8e30d2664db2e1b1dd205f5a07d13a8bd3c')

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
