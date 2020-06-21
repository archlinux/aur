# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-www-curl
pkgver=4.17
pkgrel=10
pkgdesc="Perl/CPAN Module WWW::Curl"
arch=('x86_64')
url="https://search.cpan.org/dist/WWW-Curl/"
license=("GPL" "PerlArtistic")
depends=("curl")
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/S/SZ/SZBALINT/WWW-Curl-${pkgver}.tar.gz"
        'curl-7.50.2.patch')
md5sums=('997ac81cd6b03b30b36f7cd930474845'
         '84916bb88dd596cf9ec1a0924cd97913')

prepare() {
  cd WWW-Curl-${pkgver}

  # https://rt.cpan.org/Public/Bug/Display.html?id=117793
  patch -Np1 -i ../curl-7.50.2.patch
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
