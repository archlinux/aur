# Maintainer: Lukas Weber <laochailan web de>
# Contributor: Andrei Alexeyev <akari taisei-project org>
# Contributor: cyberpunkrocker <l33tmmx gmail com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=taisei
pkgver=1.4.6
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'mimalloc' 'sdl3' 'freetype2' 'libwebp' 'libunibreak' 'libpng' 'zlib' 'zstd' 'opusfile' 'hicolor-icon-theme')
makedepends=('meson' 'cglm' 'gamemode' 'python-docutils')
source=("https://github.com/taisei-project/taisei/releases/download/v$pkgver/taisei-$pkgver.tar.xz")
sha256sums=('18d03c67dcc8c7faff22e8defdafc3a734b46c591618d1a678e6e914846889d9')




build() {
    cd $pkgname-$pkgver
    arch-meson . build \
        -Dinstall_macos_bundle=disabled \
        -Dinstall_relocatable=disabled \
        -Dr_gles30=disabled \
        -Dshader_transpiler=disabled \
        -Dshader_transpiler_dxbc=disabled
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
