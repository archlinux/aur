# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libusbgx
pkgver=0.2.0
pkgrel=2
pkgdesc='Library encapsulating the kernel USB gadget-configfs userspace API functionality'
arch=('x86_64')
url='https://github.com/libusbgx/libusbgx/'
depends=('libconfig')
makedepends=('automake')
license=('GPL2')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/libusbgx/libusbgx/archive/libusbgx-v${pkgver}.tar.gz"
  "https://github.com/libusbgx/libusbgx/commit/b5ad66eb1e46281981adb33a38e9c5a2767c0c44.patch"
  "https://github.com/libusbgx/libusbgx/commit/45c14ef4d5d7ced0fbf984208de44ced6d5ed898.patch"
)

prepare() {
  cd "${srcdir}/libusbgx-libusbgx-v${pkgver}"
  patch -p1 < "${srcdir}/"b5ad66eb1e46281981adb33a38e9c5a2767c0c44.patch
  patch -p1 < "${srcdir}/"45c14ef4d5d7ced0fbf984208de44ced6d5ed898.patch
}

build() {
  cd "${srcdir}/libusbgx-libusbgx-v${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libusbgx-libusbgx-v${pkgver}"

  make install DESTDIR="$pkgdir"
}

sha256sums=('b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2'
            '61fe8b0a56a72cea71cc57e964c8489c860c0148957e0d1599f790d86cac5a73'
            '6257f537cbf4f471d974333cc3a5ac06431d63a14210189244dcfc8625ea77dc')
