# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=1.3.3
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots' 'pango')
makedepends=('meson' 'ninja' 'pandoc')
optdepends=('wl-clipboard: clipboard support'
            'xorg-server-xwayland: x application support')
options=('!buildflags' '!strip')
conflicts=('cagebreak-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('313994e93c1116d5ff3bcda255f4ce93037a2e45b687727e45d1d6abd2c3954e63c577d71b6e677acfb125c800d5274d8c3350fa42fae6f5e52da0eb1785d9ca')
build() {
	cd "$pkgname"
	meson build --buildtype=release -Dxwayland=true
	ninja -C build
}
check() {
	cd "$pkgname"
	gpg --verify signatures/cagebreak.sig build/cagebreak
}
package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	cp 'build/cagebreak' "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	mkdir -p "$pkgdir/usr/share/man/man5/"
	cp 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"
	cp 'build/cagebreak.1' "$pkgdir/usr/share/man/man1/"
	cp 'build/cagebreak-config.5' "$pkgdir/usr/share/man/man5/"
}
