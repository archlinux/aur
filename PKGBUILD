# Maintainer: Rikai <rikaisensei@gmail.com>
pkgname=rdm
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple yet powerful dotfile manager powered by lua"
arch=('x86_64' 'aarch64')
url="https://github.com/Rikaisan/rdm"
license=("GPL-3.0-only")
depends=("libgit2" "glibc" "gcc-libs")
makedepends=("meson")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rikaisan/rdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d082e8b906142633dd8a6ed88d1f0f196d9090ba9496180c4b199f3bacc4105')

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
