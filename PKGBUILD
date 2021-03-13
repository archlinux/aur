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
            '4a9f27c170fd7ff3bc8bd9c04b8fcb5cda1cac4f3929319b6b5f22cdb64af4a8b8173dbda68fa1b70e6eaf91b9010aee')

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
