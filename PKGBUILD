# Maintainer: GordonGR <gordongr@freemail.gr>
# Contributor: Kritoke <kritoke@gamebox.net>

pkgname=lib32-libsidplay
_pkgname=libsidplay
pkgver=1.36.59
pkgrel=1
pkgdesc="A library for playing SID music files, lib32."
arch=('x86_64')
url="http://critical.ch/distfiles/"
license=('GPL')
options=('!libtool')
depends=("${_pkgname}")
source=("http://critical.ch/distfiles/${_pkgname}-${pkgver}.tgz"
		"libsidplay-1.36.59-gcc43.patch")
md5sums=('37c51ba4bd57164b1b0bb7b43b9adece'
		'c24d7bca2639f4fee03c40c7dcaadfee')

prepare() {
cd ${srcdir}/${_pkgname}-${pkgver}
patch -Np1 -i $srcdir/libsidplay-1.36.59-gcc43.patch
}

build() {
cd ${srcdir}/${_pkgname}-${pkgver}
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32

make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  cd "$pkgdir/usr"
  rm -rf include/
}
