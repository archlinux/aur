# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=deutex
pkgver=5.2.3
pkgrel=1
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('aarch64' 'x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.zst)
b2sums=('fd422f5256d633983420c3d79b12cb95bde4fc6b9aeaf49d93476c169ba9f768bf4d56e3a15e0ae2d946a9a3dc271bf43d2a130e4e258921ab7b298bb69ef19d')

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
