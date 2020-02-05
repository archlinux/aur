# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=mangohud
pkgver=0.1.0
pkgrel=1
pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
url='https://github.com/flightlessmango/MangoHud'
license=('GPL2')
arch=('x86_64')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('gcc-libs' 'libx11')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --depth 50
}

build() {
    arch-meson "$srcdir/$pkgname" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
