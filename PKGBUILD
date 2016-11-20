# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=grrlib
pkgver=4.3.2
pkgrel=2
pkgdesc="A helper library for Nintendo Gamecube/Wii homebrew developers"
arch=('any')
url="http://grrlib.santo.fr/"
license=('MIT')
depends=("libfat-ogc")
makedepends=("devkitppc")
source=("https://github.com/GRRLIB/GRRLIB/archive/$pkgver.tar.gz"
        "https://github.com/GRRLIB/GRRLIB/releases/download/$pkgver/HTML-documentation.zip")
sha256sums=('198e8d4f06cb1e6b7328569ca4ccb7e238e18cb2fc90225fd7e28b7583d16f49'
            '44a2df2136825da162d047bfeec130e96825afd292d7eb4c02b15505611a7ded')
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitppc.sh
  unset CFLAGS

  make -C GRRLIB-$pkgver/GRRLIB
}

package() {
  cd GRRLIB-$pkgver
  DEVKITPRO="$pkgdir/$DEVKITPRO" make -C GRRLIB install

  # license
  install -Dm0644 LICENCE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # examples
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup examples "$pkgdir"/usr/share/$pkgname
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname/doxygen
  install -m0644 README.html grrlib_logo.png "$pkgdir"/usr/share/doc/$pkgname
  cp -rup ../doc/* "$pkgdir"/usr/share/doc/$pkgname/doxygen
}
