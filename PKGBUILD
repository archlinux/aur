# Maintainer: Rikai <rikaisensei@gmail.com>
pkgname=rdm
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple yet powerful dotfile manager powered by lua"
arch=('x86_64' 'aarch64')
url="https://github.com/Rikaisan/rdm"
license=("GPL-3.0-only")
depends=("libgit2" "glibc" "gcc-libs")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rikaisan/rdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbb95e37ec07ef6a9b538ef05b54200589adca9149531dcbeda42397a2bd80e5')

prepare() {
	cd "$pkgname-$pkgver"
	meson subprojects download
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson . build
}

package() {
	cd "$pkgname-$pkgver"
	meson install -C build --skip-subprojects --destdir "$pkgdir"
	install -Dm644 src/rdmlib.lua "$pkgdir/usr/share/$pkgname/rdmlib.lua"
}
