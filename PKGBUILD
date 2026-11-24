# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.8.1
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('BSD-3-Clause')
depends=(libaio liburing)
makedepends=(meson)
source=("https://github.com/xnvme/xnvme/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fc06ce2214bdd6143b4611b5923a9780bc4fe799b52e4a3c1c8cf594bff4dcee')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled -Dwith-isal=disabled -Dwith-spdk=disabled -Dwith-cuda=disabled -Dwith-hip=disabled -Dwith-cuse=enabled -Dsystemd=enabled -Dexamples=false -Dtests=false -Dforce_completions=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
