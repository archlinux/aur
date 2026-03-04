# Maintainer: Rikai <rikaisensei@gmail.com>
pkgname=rdm
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple yet powerful dotfile manager powered by lua"
arch=('x86_64' 'aarch64')
url="https://github.com/Rikaisan/rdm"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs" "lua")
optdepends=("libgit2: repository cloning support")
makedepends=("meson" "libgit2")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rikaisan/rdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('550e2c8eddf58656fa4cfa7867d1c64031d316e7c48d751ec71b6760cc3d68c8')

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
