# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.7.3
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('BSD-3-Clause')
depends=(libaio liburing)
makedepends=(meson)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('4a841043566b5d6cd813ca5be69937aa')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled -Dwith-spdk=false -Dexamples=false -Dtests=false -Dforce_completions=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
