# Maintainer: Jack Mortimer <jackmortimer33@gmail.com>
pkgname=adpcm-xq-git
pkgver=0.5.r47.g4cc950c
pkgrel=1
pkgdesc="Xtreme Quality IMA-ADPCM WAV Encoder / Decoder"
arch=('x86_64')
url="https://github.com/dbry/adpcm-xq"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dbry/adpcm-xq.git")
sha256sums=('SKIP')

pkgver() {
  cd adpcm-xq
  printf "%s.r%s.g%s" "$(grep -oP 'Version \K[0-9.]+' adpcm-xq.c | head -1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd adpcm-xq
  gcc $CFLAGS $LDFLAGS *.c -lm -o adpcm-xq
}

package() {
  cd adpcm-xq
  install -Dm755 adpcm-xq "${pkgdir}/usr/bin/adpcm-xq"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
