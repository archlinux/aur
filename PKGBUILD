# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=3.2.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots0.20' 'pango')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
options=('!buildflags' '!strip')
conflicts=('cagebreak-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('fc17e1cb63a20d7bb5e7c66e8db199fc7212f521cef310c52ca978b971823b34efc0ec56aabeefdf9b30602754b3ad34e38310bec2eadeb67fcf9bc31cfcd15a')
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
