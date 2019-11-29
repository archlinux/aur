# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl-git
pkgver=1.01.r31.gb018742
pkgrel=1
pkgdesc='A library which provides the basic sigrok protocol decoders for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(python glib2)
makedepends=(git)
conflicts=(libsigrokdecode libsigrokdecode-git)
provides=(libsigrokdecode libsigrokdecode-git)
source=(git://github.com/DreamSourceLab/DSView.git)
sha1sums=('SKIP')

pkgver() {
  cd DSView
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd DSView/libsigrokdecode4DSL

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd DSView/libsigrokdecode4DSL
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
