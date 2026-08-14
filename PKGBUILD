pkgname=fenriz-git
pkgver=0.1.11
pkgrel=1
pkgdesc="A fast, stable tiling Wayland compositor"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('wlroots0.20' 'scenefx0.5' 'wayland' 'libxkbcommon' 'pixman' 'libinput' 'libxcb' 'xcb-util-wm')
makedepends=('cmake' 'ninja' 'git' 'wayland-protocols')
optdepends=('xorg-xwayland: X11 application support'
            'fenriz-desktop: wallpaper, launcher, lock screen, notifications and OSDs')
provides=('fenriz')
conflicts=('fenriz' 'fenriz-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S "${pkgname%-git}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
