# Maintainer: Lukas Weber <laochailan web de>
# Contributor: Andrei Alexeyev <akari taisei-project org>
# Contributor: cyberpunkrocker <l33tmmx gmail com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=taisei
pkgver=1.4.1
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'sdl2' 'cglm' 'freetype2' 'libwebp' 'libzip' 'zstd' 'opusfile' 'hicolor-icon-theme')
makedepends=('meson' 'gamemode' 'python-docutils' 'python-zstandard')
source=("https://github.com/taisei-project/taisei/releases/download/v$pkgver/taisei-$pkgver.tar.xz")
sha256sums=('98a4fcea296e7bd3ef21c23adf065500ee5e41cbc66e6cf611168a20cd539a01')


build() {
    cd $pkgname-$pkgver
    arch-meson . build \
        -Dinstall_macos_bundle=disabled \
        -Dinstall_relocatable=disabled \
        -Dr_gles20=disabled \
        -Dr_gles30=disabled \
        -Dshader_transpiler=disabled
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
