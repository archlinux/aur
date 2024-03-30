# Maintainer: U.G. Kulothungan <kulothunganug at gmail dot com>

_pkgname="vigiland"
pkgname="$_pkgname-git"
pkgver=r11.6b84e1a
pkgrel=1
pkgdesc="Inhibit idle behaviour of a Wayland compositor"
arch=(x86_64)
url="https://github.com/Jappie3/$_pkgname"
license=(AGPL3)
depends=(gcc-libs glibc wayland wayland-protocols)
makedepends=(cargo git)
conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!debug)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	cargo fetch --locked
}

build() {
	cd $_pkgname
	cargo build --locked --release
}

package() {
	cd $_pkgname
	install -vDm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

