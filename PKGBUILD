# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=grrlib
pkgver=4.3.2
pkgrel=2
pkgdesc="A graphics library for Wii homebrew developers."
arch=('any')
url="http://grrlib.santo.fr/"
license=('MIT')
depends=("libfat-ogc")
makedepends=("devkitppc")
source=("http://grrlib.googlecode.com/files/GRRLIB%20${pkgver}.zip")
sha256sums=('18b159f466ea93bfbc304921b9fe2cbba37eba7a9066dfa97c0766e7daddb7cd')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitppc.sh

  cd GRRLIB/GRRLIB
  unset CFLAGS
  make
}

package() {
  cd GRRLIB/GRRLIB
  DEVKITPRO="$pkgdir/$DEVKITPRO" make install

  cd ..
  install -Dm644 LICENCE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -rup doc examples README.html grrlib_logo.png "$pkgdir"/usr/share/doc/$pkgname
}
