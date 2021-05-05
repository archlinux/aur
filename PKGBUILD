# Maintainer: Adis Hamzić <adis at hamzadis dot com>

pkgname=foo2zjs-minimal-nightly
pkgver=20210313
pkgrel=1
pkgdesc="Archived version of foo2zjs printer drivers with the bare minimum compilation options to ensure package stability."
url="https://github.com/hamzadis/foo2zjs-archive"
license=('GPL' 'custom')
depends=('cups' 'ghostscript')
makedepends=('foomatic-db-engine' 'foomatic-db' 'curl' 'bc')
conflicts=('foo2zjs-nightly')
provides=('foo2zjs-nightly')
arch=('i686' 'x86_64')
source=("https://github.com/hamzadis/foo2zjs-archive/releases/download/20210313/foo2zjs.tar.gz")
md5sums=('c6cbaa467a9a73a7c542f5a6c63723de')

build() {
  cd "${srcdir}/foo2zjs"
  make all
}

package() {
  cd "${srcdir}/foo2zjs"
  install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}" UDEVBIN="${pkgdir}/usr/bin" install
}
