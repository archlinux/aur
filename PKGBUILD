# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.7.4
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('BSD-3-Clause')
depends=(libaio liburing)
makedepends=(meson)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6d42d0bd7e6b395a37869a8713d138d332500f20ecc272ebf6789471026a7191')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled -Dwith-isal=disabled -Dwith-spdk=false -Dexamples=false -Dtests=false -Dforce_completions=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
