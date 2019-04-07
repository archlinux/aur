# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Zebulon <zeb@zebulon.org.uk>

pkgname=lib32-libxxf86dga
pkgver=1.1.5
pkgrel=1
pkgdesc="X11 Direct Graphics Access extension library (32 bit)"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxext' "${pkgname#*-}")
makedepends=('xorg-util-macros' 'gcc-multilib')
source=("http://xorg.freedesktop.org/releases/individual/lib/libXxf86dga-$pkgver.tar.bz2")
sha256sums=('2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libXxf86dga-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  make -C libXxf86dga-$pkgver DESTDIR="${pkgdir}" install

  # remove things already in libxxf86dga package
  rm -rf "$pkgdir"/usr/{bin,include,share}
  # link to license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir/usr/share/licenses/$pkgname"
}
