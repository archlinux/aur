# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=1.4.2
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
sha512sums=('56973ddf4b0e14467151daf69e03cd7df758a124c608f0bc5e97d5da7849d0989468d644af59a1408a8059653b4dffffda733fb8be4abcbe58f7904a78777452')
build() {
	cd "$pkgname"
	meson build --buildtype=release -Dxwayland=true
	ninja -C build
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
