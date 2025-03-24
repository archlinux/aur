# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.83
pkgrel=1
epoch=1
pkgdesc='Comskip is a free MPEG commercial break detector'.
_gitname='comskip'
url='http://github.com/erikkaashoek/Comskip'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git')
depends=('ffmpeg4.4' 'argtable')
source=("https://github.com/erikkaashoek/Comskip/archive/V0.83.tar.gz")
sha256sums=("bd90d7922916e0b04ea9f3426ea7747d347f218f3f915fb4d251961d0730876e")


build() {
  cd "${srcdir}/Comskip-${pkgver}"
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig/ ./configure --prefix=/usr
  make clean
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/Comskip-${pkgver}/comskip" "$pkgdir/usr/bin/comskip"
  if [ -e "${srcdir}/Comskip-${pkgver}/comskip-gui" ]; then
    install -m755 "${srcdir}/Comskip-${pkgver}/comskip-gui" "$pkgdir/usr/bin/comskip-gui"
  fi
}

# vim:set ts=2 sw=2 et:
