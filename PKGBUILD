# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>
# Previous maintainer: Alex Peltzer ("alexpe87") <alexpe.aur@mailbox.org>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bwa
pkgver=0.7.17
_pkgver=${pkgver}
pkgrel=2
pkgdesc="Burrows-Wheeler Aligner maps low-divergent sequences against a large reference genome"
arch=('i686' 'x86_64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL3')
depends=('perl' 'zlib')
source=("https://github.com/lh3/bwa/releases/download/v$pkgver/bwa-${_pkgver}.tar.bz2"
        'backported.patch')
sha256sums=('de1b4d4e745c0b7fc3e107b5155a51ac063011d33a5d82696331ecf4bed8d0fd'
            'ec91adc478cbf207c694c5b7e46738dcbd77cd77180c7a6279d3e000108fe8c2')

prepare() {
    patch --directory="$pkgname-$_pkgver" --forward --strip=1 --input="${srcdir}/backported.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -Dm755 bwa          "$pkgdir/usr/bin/bwa"
  install -Dm755 qualfa2fq.pl "$pkgdir/usr/bin/qualfa2fq"
  install -Dm755 xa2multi.pl  "$pkgdir/usr/bin/xa2multi"
  install -Dm644 bwa.1        "$pkgdir/usr/share/man/man1/bwa.1"
  install -Dm644 COPYING      "$pkgdir/usr/share/licenses/${pkgname}"
}
