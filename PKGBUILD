# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=grrlib
pkgver=4.4.1
pkgrel=1
pkgdesc="A helper library for Nintendo Gamecube/Wii homebrew developers"
arch=('any')
url="http://grrlib.santo.fr/"
license=('MIT')
depends=("libfat-ogc")
makedepends=("devkitPPC")
source=("https://github.com/GRRLIB/GRRLIB/archive/v$pkgver.tar.gz"
        "https://github.com/GRRLIB/GRRLIB/releases/download/v$pkgver/PDF-documentation.pdf")
sha256sums=('cc5e1453fb088a49f04f49d6e27901f63a22fe4e26bf6972b57d00b291870a7a'
            'db015694ff53dfde0f8666165dd8d5e743ea8ef80d566b25f7cee197b467e7d2')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkit-env.sh
  unset CFLAGS

  make -C GRRLIB-$pkgver/GRRLIB
}

package() {
  cd GRRLIB-$pkgver
  DEVKITPRO="$pkgdir/$DEVKITPRO" make -C GRRLIB install

  # license
  install -Dm0644 LICENCE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # examples
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup examples "$pkgdir"/usr/share/$pkgname
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname/doxygen
  install -m0644 README.md docs/* ../PDF-documentation.pdf "$pkgdir"/usr/share/doc/$pkgname
}
