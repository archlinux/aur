# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=grrlib
pkgver=4.5.1
pkgrel=1
pkgdesc="A helper library for Nintendo Gamecube/Wii homebrew developers"
arch=('any')
url="http://grrlib.santo.fr/"
license=('MIT')
depends=("libfat-ogc")
makedepends=("devkitPPC")
source=("https://github.com/GRRLIB/GRRLIB/archive/v$pkgver.tar.gz"
        "https://github.com/GRRLIB/GRRLIB/releases/download/v$pkgver/PDF-documentation.pdf")
sha256sums=('9fe1debb1d058449a1ca831a5102fc75d6ac25324480844b3ac8fb347d2bc65a'
            'e242184a5dcdb4e53e0641772026e79d85af78bfa90fb1ce027eb063fa855a4a')
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
