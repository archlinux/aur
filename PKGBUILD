# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=2.1.0
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
sha512sums=('9b4f426573d52a05ac95909141b6d236b4cbd29df8170d43abc5df31b74ccb389b1c2234ea56219648fdde043b7a48a56bc8392993d4b387066ea5de29d80ebf')
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
