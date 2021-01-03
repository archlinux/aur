# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=deutex
pkgver=5.2.2
pkgrel=2
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.zst
        0001-Update_copyright_year_to_2021.patch)
b2sums=('ad290ce6792425ba7f643cfe6c09c1a3f040ad0a4c95822f9368592dde6d489d28e892a26d78f2ebfefa086c910c948ef37eb3a3047429605653b273f9b567a8'
        '0e3ad1ec029f0547c7f070dde120bde658389598c67dde48185fc7479ade45676278903b080c22c28fda0afb07f2cca82cb214e13ba9eb220c3248969fd8c4b5')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
