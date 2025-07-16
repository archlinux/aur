# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=grrlib
pkgver=4.6.0
pkgrel=1
pkgdesc="A helper library for Nintendo Gamecube/Wii homebrew developers"
arch=('any')
url="http://grrlib.santo.fr/"
license=('MIT')
depends=("libfat-ogc" "ppc-freetype" "ppc-libjpeg-turbo" "ppc-libpng")
makedepends=("devkitPPC" "catnip")
source=("https://github.com/GRRLIB/GRRLIB/archive/v$pkgver.tar.gz"
        "https://github.com/GRRLIB/GRRLIB/releases/download/v$pkgver/PDF-documentation.pdf")
sha256sums=('a01b3580a725de261cde62c050f353c5aaf2e2b15dd0b8163f12633c3674bd04'
            '4957d1ebedfaf49a461f6b2311cfb93b1d9b0bba8af08946c4359485822391c5')
options=(!strip libtool staticlibs)

build() {
  cd GRRLIB-$pkgver

  # set environment
  source /etc/profile.d/devkit-env.sh
  unset CFLAGS
  unset CXXFLAGS

  catnip -t wii
}

package() {
  cd GRRLIB-$pkgver
  DESTDIR=${pkgdir} catnip install

  # license
  install -Dm0644 LICENCE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # examples
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup examples "$pkgdir"/usr/share/$pkgname
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname/doxygen
  install -m0644 README.md docs/* ../PDF-documentation.pdf "$pkgdir"/usr/share/doc/$pkgname
}
