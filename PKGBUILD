# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=2.1.1
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
sha512sums=('ed8d546ae59c2b982b975452de33e45f68feca8950b28510a0f535cdd3a11902d31ef95e1e9cafebc6dcf347cf96f8867fef8b1a77f244c699ff94a527654d8b')
build() {
	meson setup --prefix=/usr --buildtype=release -Dman-pages=true -Dxwayland=true $pkgname build
	meson compile -C build
}
check() {
	meson test -C build --suite basic
}
package() {
	meson install -C build --destdir $pkgdir
}
