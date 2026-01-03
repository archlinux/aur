# Maintainer: Boux
pkgname=vkbasalt-overlay-git
pkgver=r629.ca0f13b
pkgrel=2
pkgdesc="Vulkan post-processing layer with in-game ImGui overlay for real-time effect configuration"
arch=('x86_64')
url="https://github.com/Boux/vkBasalt_overlay"
license=('zlib')
depends=('gcc-libs' 'glslang' 'libx11' 'libxi')
makedepends=('git' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git')
provides=('vkbasalt')
conflicts=('vkbasalt' 'vkbasalt-git')
source=("${pkgname}::git+https://github.com/Boux/vkBasalt_overlay.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    arch-meson build --buildtype=release
    ninja -C build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
