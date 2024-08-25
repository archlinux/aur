# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgname=adapterremoval
pkgver=2.3.4
pkgrel=2
pkgdesc='Remove remnant adapter sequences from High-Throughput Sequencing (HTS) data and trim low quality bases from the 3 prime end'
arch=('x86_64')
url='https://github.com/MikkelSchubert/adapterremoval'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'bzip2' 'zlib')
makedepends=('python-sphinx' 'libdeflate' 'isa-l')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/MikkelSchubert/adapterremoval/archive/refs/tags/v${pkgver}.tar.gz
        )
sha256sums=('a4433a45b73ead907aede22ed0c7ea6fbc080f6de6ed7bc00f52173dfb309aa1')
prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '6s/:/?/' Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  export PREFIX="/usr"
  make everything
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
