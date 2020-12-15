# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>
# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-www-curl
pkgver=4.17
pkgrel=13
pkgdesc="Perl/CPAN Module WWW::Curl"
arch=('x86_64')
url="https://search.cpan.org/dist/WWW-Curl/"
license=("GPL" "PerlArtistic")
depends=("curl")
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/S/SZ/SZBALINT/WWW-Curl-${pkgver}.tar.gz"
        'curl-7.71.0.patch')
sha256sums=('52ffab110e32348d775f241c973eb56f96b08eedbc110d77d257cdb0a24ab7ba'
            'da51d5f2a2993dd33f5a7baf358a61086440abb50e4dd3ca1f4939ea262d3cc2')

prepare() {
  cd WWW-Curl-${pkgver}

  patch -Np1 -i ../curl-7.71.0.patch
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
