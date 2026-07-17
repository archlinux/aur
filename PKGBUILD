# Maintainer: graysky <graysky AT proton DOT me>
# Contributor: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.83
pkgrel=2
pkgdesc='MPEG commercial break detector'
_gitname=comskip
url='http://github.com/erikkaashoek/Comskip'
arch=(x86_64)
license=(GPL-3.0-or-later)
makedepends=(git)
depends=(ffmpeg4.4 argtable)
optdepends=('comchap: Detect commercials with Comskip and add chapter marks (comchap) or cut them (comcut)')
source=("https://github.com/erikkaashoek/Comskip/archive/V0.83.tar.gz")
sha256sums=('bd90d7922916e0b04ea9f3426ea7747d347f218f3f915fb4d251961d0730876e')

build() {
  cd "${srcdir}/Comskip-${pkgver}"
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig/ ./configure --prefix=/usr CFLAGS="${CFLAGS} -std=gnu17"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/Comskip-${pkgver}/comskip" "$pkgdir/usr/bin/comskip"
  install -m755 "${srcdir}/Comskip-${pkgver}/comskip-gui" "$pkgdir/usr/bin/comskip-gui"
}

# vim:set ts=2 sw=2 et:
