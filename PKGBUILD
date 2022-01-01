# Maintainer: Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl
pkgver=1.12
pkgrel=2
pkgdesc='A library which provides the basic sigrok protocol decoders for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(python glib2)
makedepends=(git)
source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
  "segfault.patch::https://github.com/DreamSourceLab/DSView/commit/4a73d00967219368926a089c0eb3598e4b811f55.patch"
)
sha384sums=('52b9fc2dbd9853f33140c2c528d1b31187a185f5869dd4e7700da1da872fec0d2d03732e4f194f487a287107c3e9b0e0'
            '0180f269174cd9fda379868c6102b7163c382e7ded3474b3f983ba6737459f2dd1cf433dceb285b4cb103925097b85ab')

_wdir() {
	cd "$srcdir/DSView-$pkgver/libsigrokdecode4DSL"
}

prepare() {
  _wdir
  patch -Np2 < "$srcdir/segfault.patch"
}

build() {
  _wdir

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  _wdir
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
