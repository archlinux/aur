# Maintainer:ston<2424284164@qq.com>
pkgname=gtk-qq-git
pkgver=r415.a80ba96
pkgrel=1
pkgdesc="Unofficial Linux QQ client, based on GTK4."
arch=('x86_64')
url="https://github.com/lomirus/gtk-qq"
license=('AGPL3')
depends=('openssl' 'gtk4')
makedepends=('pkgconf' 'libadwaita' 'meson' 'rustup')
source=(
	git+${url}
)

sha512sums=('SKIP')

pkgver() {
	cd gtk-qq
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd gtk-qq
	meson setup builddir
	meson compile -C builddir
	rustup install nightly
	rustup override set nightly
	cargo build --release
}

check() {
	meson test -C builddir
}

package() {
	install -d /usr/bin
	install -Dm755 ${srcdir}/gtk-qq/target/release/gtk-qq ${pkgdir}/usr/bin/gtk-qq
}
