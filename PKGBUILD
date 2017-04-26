# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo-git
pkgver=3.1+0.g25f5e0e
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=('git://git.kraxel.org/drminfo')
sha256sums=('SKIP')
depends=('libdrm' 'mesa' 'libepoxy' 'cairo' 'pixman' 'gtk3')
makedepends=('meson')
conflicts=('drminfo')
provides=("drminfo=${pkgver%+*}")

pkgver() {
  cd drminfo
  git describe --long | sed 's/^drminfo-//; s/-/./; s/-/+/; s/-/./'
}

prepare() {
  cd drminfo
  rm -rf build
  meson build --prefix='/usr'
}

build() {
  cd drminfo
  ninja -C build
}

package() {
  cd drminfo
  DESTDIR="${pkgdir}" ninja -C build install
}
