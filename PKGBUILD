# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Robert Emil Berge <robert@rebi.no>

_pkgname=libavc1394
pkgname=lib32-libavc1394
pkgver=0.5.4
pkgrel=3
pkgdesc="A library to control A/V devices using the 1394ta AV/C commands (32-bit)"
arch=("x86_64")
url="https://sourceforge.net/projects/libavc1394/"
license=('LGPL')
depends=('lib32-libraw1394' 'libavc1394')
source=("https://downloads.sourceforge.net/sourceforge/libavc1394/${_pkgname}-${pkgver}.tar.gz")
md5sums=('caf0db059d8b8d35d6f08e6c0e1c7dfe')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --build=i686-pc-linux-gnu --prefix=/usr --libdir=/usr/lib32 --mandir=/usr/share/man --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/{bin,share,include}
}
