# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>
# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-www-curl
pkgver=4.17
pkgrel=18
pkgdesc="Perl/CPAN Module WWW::Curl"
arch=('x86_64')
url="https://search.cpan.org/dist/WWW-Curl/"
license=("GPL" "PerlArtistic")
depends=("curl")
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://search.cpan.org/CPAN/authors/id/S/SZ/SZBALINT/WWW-Curl-${pkgver}.tar.gz"
        'makefile.patch')
sha256sums=('52ffab110e32348d775f241c973eb56f96b08eedbc110d77d257cdb0a24ab7ba'
            'fd9136144955c8a14d0413f3b78ddc3ad9914e45936691686c6bbf3e1eadc013')

prepare() {
  cd WWW-Curl-${pkgver}

  patch -Np1 -i ../makefile.patch
}

build() {
  cd WWW-Curl-${pkgver}

  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd WWW-Curl-${pkgver}

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
