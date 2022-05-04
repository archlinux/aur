#Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxvmc
pkgname=lib32-$_pkgbasename
pkgver=1.0.13
pkgrel=1
pkgdesc="X11 Video Motion Compensation extension library (32-bit)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxv>=1.0.5' $_pkgbasename)
source=(${url}/releases/individual/lib/libXvMC-${pkgver}.tar.xz{,.sig})
sha256sums=('0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E'  # Alan Coopersmith <alan.coopersmith@oracle.com>
              'C41C985FDCF1E5364576638B687393EE37D128F8'  # Matthieu Herrb <matthieu.herrb@laas.fr>
              '995ED5C8A6138EB0961F18474C09DD83CAAA50B2'  # Adam Jackson <ajax@nwnk.net>
              '3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libXvMC-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd libXvMC-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
