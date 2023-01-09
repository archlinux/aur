# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=2.0.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots<0.17.0' 'pango')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
options=('!buildflags' '!strip')
conflicts=('cagebreak-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('6b9a687741bc4924305e3d2b42d9582473b35a29a546397128b737f962fae02c38d274fd33d01d112cd56a3b0e56ef754700adc348ae2d844e3efdf90ab89da0')
build() {
	cd "$pkgname"
	meson setup build --buildtype=debug -Dman-pages=true -Dxwayland=true
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
