# Maintainer: Rikai <rikaisensei@gmail.com>
pkgname=rdm
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple yet powerful dotfile manager powered by lua"
arch=('x86_64' 'aarch64')
url="https://github.com/Rikaisan/rdm"
license=("GPL-3.0-only")
depends=("libgit2" "glibc" "gcc-libs")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rikaisan/rdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d89b94dab9d49ffc9c5f35bbc1c95f1876deb9e072dc739ee6dafb406c83d0a')

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
