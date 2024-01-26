# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=2.3.0
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
sha512sums=('f82fdae9f975eda4f6e3c07d85ab8f74344a583b7d323cdeec6e1cf2dc159f787b36174191b71484ba1a8d4ac2cb008940a564e70d42633b88637d4049ff68da')
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
