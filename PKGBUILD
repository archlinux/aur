# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=2.2.3
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots<0.18.0' 'pango')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
options=('!buildflags' '!strip')
conflicts=('cagebreak-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('3f4e32cdd5cb98c1962630d532b445ce0539f157d082afabaaaa9cddcc1b27ff213ecac3bec87b0e848e1782e6ad7e7a551e714a3b3b9f6d14a0497f0d3bb8f8')
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
