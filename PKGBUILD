# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.
pkgname=vkbasalt-overlay
pkgver=0.1.2
pkgrel=1
pkgdesc="Vulkan post-processing layer with in-game ImGui overlay"
arch=('x86_64')
url="https://github.com/Boux/vkBasalt_overlay"
license=('Zlib')
depends=('gcc-libs' 'libx11' 'libxi')
makedepends=('meson' 'ninja' 'glslang' 'spirv-headers' 'vulkan-headers')
optdepends=('lib32-vkbasalt-overlay: 32-bit library for native 32-bit Vulkan apps')
options=('!libtool')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Boux/vkBasalt_overlay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dcaba2e47d4a1956d9ff892ac95e1f76ac0e55a806c6119a94ab591c04b1b03c')

build() {
    cd "vkBasalt_overlay-${pkgver}"

    arch-meson --buildtype=release build
    ninja -C build
}

package() {
    cd "vkBasalt_overlay-${pkgver}"

    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
