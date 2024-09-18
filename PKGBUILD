# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.7.5
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('BSD-3-Clause')
depends=(libaio liburing)
makedepends=(meson)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d951a3115f686956f5c6b839b390ffb50bb443f7711fe35f57a07f4d0667277f')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled -Dwith-isal=disabled -Dwith-spdk=disabled -Dexamples=false -Dtests=false -Dforce_completions=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
