# Maintainer: taotieren <admin@taotieren.com>

pkgname=perl-encode-hanconvert
pkgver=0.35
pkgrel=1
pkgdesc='Modules and scripts for Traditional and Simplified Chinese mappings'
_dist=Encode-HanConvert
arch=($CARCH)
url="https://metacpan.org/release/$_dist"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=('glibc' 'perl')
makedepends=('perl-module-install')
checkdepends=('perl-test-differences')
optdepends=()
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/A/AU/AUDREYT/${_dist}-${pkgver}.tar.gz")
sha256sums=('65519610e33ee9b4c13f0674d08a32445ff3fe64bb6091332925e71c7b6cead8')

build() {
    cd $_dist-$pkgver
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd $_dist-$pkgver
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
    cd $_dist-$pkgver
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
