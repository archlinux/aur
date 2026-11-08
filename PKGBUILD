# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Christian Sturm <reezer@reezer.org>

_author=SYP
_dist=Net-Curl
pkgname=perl-${_dist@L}
pkgver=0.60
pkgrel=1
pkgdesc='Perl interface for libcurl'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('MIT')
depends=(
    'curl>=7.15.5'
    'perl-carp'
    'perl-exporter'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
optdepends=(
    'perl-extutils-pkgconfig'
    'perl-xsloader'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f1a84e8ef4fde7759c8913b87c8b6582b795345d7012cae52392a8e1500433f8')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
