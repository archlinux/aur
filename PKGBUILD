# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir.archlinux.org>

pkgname=lib32-muparser
pkgver=2.2.3
pkgrel=1
pkgdesc="Fast math parser library (32 bit)"
arch=('x86_64')
url="http://muparser.sourceforge.net"
license=('custom')
depends=('gcc-libs-multilib' 'muparser')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("http://downloads.sourceforge.net/muparser/muparser_v${pkgver//./_}.zip")
sha256sums=('dfe831b69392ab0b1eb59d3601b7b1575554a85057cf2f234f64f930c4148902')

build() {
  cd muparser_v${pkgver//./_}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-samples
  make
}

package() {
  make -C muparser_v${pkgver//./_} DESTDIR="$pkgdir" install
  # remove stuff already present in muparser package
  rm -rf "$pkgdir"/usr/{include,share}
  # license
  install -d "$pkgdir"/usr/share/licenses
  ln -s muparser "$pkgdir"/usr/share/licenses/$pkgname
}
