# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=xasm
pkgver=3.1.0
pkgrel=1
pkgdesc="6502 cross-assembler with original syntax extensions"
arch=('x86_64')
url="https://github.com/pfusik/xasm"
source=(
    https://github.com/pfusik/xasm/archive/xasm-$pkgver.zip
    0001-hex.patch
    0002-string-concat.patch
    )

sha256sums=(
    '835e8a4e9971c263ddf3f82366a4909201cfb2f49e9a842b9d8ce0be397ba249'
    '3a619a404bf8b901e8f85606ac84ab89c35c4edee1df728a9eeeabddaf95098e'
    '7b37655e16a9de3ad2875ea68e738503492389e6822885c426a22a1c2b2a1aeb'
    )
license=('Poetic')
provides=('xasm')
depends=('glibc')
makedepends=('dmd' 'patch')

build() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"
  patch -p0 < ../0001-hex.patch
  patch -p0 < ../0002-string-concat.patch
  make
}

package() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 xasm "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/xasm"
  install -Dm644 xasm.1.txt "$pkgdir/usr/share/man/man1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/xasm"
}
