# Maintainer:  PeterB <peter at pblackman dot plus dot co.uk>
# Contributor: ShadowKyogre <shadowkyogre dot public at gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: mar77i <mysatyre at gmail dot com>
 
pkgname=qosmic
pkgver=1.6.0
pkgrel=2
pkgdesc="An application for creating, editing, and rendering flam3 fractal images"
arch=('i686' 'x86_64')
url="https://github.com/bitsed/qosmic"
license=('GPL')
depends=('qt5-base' 'lua52' 'flam3')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/bitsed/qosmic/archive/v${pkgver}.tar.gz"
	"missing-qbuttongroup-include.patch::https://aur.archlinux.org/cgit/aur.git/plain/missing-qbuttongroup-include.patch?h=qosmic"
	"lua.patch::https://patch-diff.githubusercontent.com/raw/bitsed/qosmic/pull/36.patch"
	"externc.patch::https://github.com/bitsed/qosmic/commit/bd184ab2a1d8fc11d45225018dd1ee9795da57ab.patch"
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/missing-qbuttongroup-include.patch"
  patch -Np1 -i "${srcdir}/lua.patch"
  patch -Np1 -i "${srcdir}/externc.patch"

}

build() {
  echo pkgver $pkgver  pkgrel $pkgrel
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt5
  # https://github.com/bitsed/qosmic/issues/28
  sed -i '/^DEFINES/ s/$/ -DLUA_COMPAT_5_2/' Makefile
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

sha256sums=('b61d5c6189a87701761005aa049f13e0e2f1863cba6a24397edc538f12a8a04b'
            '2b2f338dca2d35e9243baec72f2a28b2cee52ca9d90c96d7aacf8631476cab32'
            'ff44f6232f35c57a3080d76616454c7b600c7a008312e09de748f81672c97a05'
            'e3b7a2c388f96079e3bcb7234970839b6eb733c533576952c4b2a7814f355482')
