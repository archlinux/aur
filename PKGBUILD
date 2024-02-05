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
md5sums=('41272ea78d54077f4e8f9bee0a8a35e3')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled -Dwith-spdk=false -Dexamples=false -Dtests=false -Dforce_completions=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
