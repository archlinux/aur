# Maintainer: Popolon < popolon (@L popolon d0t org>

pkgname=termbox2
pkgver=2.5.0
pkgrel=1
pkgdesc="terminal I/O library"
arch=($CARCH)
url="https://github.com/termbox/termbox2"
license=('MIT')
provides=("${pkgname%-git}" 'libtermbox.so')
conflicts=("${pkgname%-git}" 'termbox')
source=("https://github.com/termbox/termbox2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d7a9811060e3673be417019007acbf4e2575734b6f95baaf6e8aed27f06c65a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make PREFIX=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
   make DESTDIR="${pkgdir}" prefix=/usr install
   make DESTDIR="${pkgdir}" prefix=/usr install_so
  install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
