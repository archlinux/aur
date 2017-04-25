# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo
pkgver=3.1
pkgrel=1
pkgdesc="drminfo"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=("https://www.kraxel.org/cgit/drminfo/snapshot/drminfo-${pkgver/./-}.tar.gz")
sha256sums=('86db7a18c71475d757bb98fa70efbe01993c25e38c7aca487b24a080bd771013')
depends=('libdrm' 'mesa' 'libepoxy' 'cairo' 'pixman' 'gtk3')
makedepends=('meson')

prepare() {
  cd drminfo-${pkgver/./-}
  rm -rf build
  meson build --prefix='/usr'
}

build() {
  cd drminfo-${pkgver/./-}
  ninja -C build
}

package() {
  cd drminfo-${pkgver/./-}
  DESTDIR="${pkgdir}" ninja -C build install
}
