# Maintainer: Lukas Weber <laochailan web de>
# Contributor: Andrei Alexeyev <akari taisei-project org>
# Contributor: cyberpunkrocker <l33tmmx gmail com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=taisei
pkgver=1.4
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'sdl2' 'cglm' 'freetype2' 'libwebp' 'libzip' 'zstd' 'opusfile' 'hicolor-icon-theme')
makedepends=('meson' 'python-docutils')
source=("https://github.com/taisei-project/taisei/releases/download/v$pkgver/taisei-$pkgver.tar.xz")
sha256sums=('cc025ad73246790e1a53978c4612b3aaffc0d3acfbfd181a39e6fbd853ca99be')

build() {
    cd $pkgname-$pkgver
    meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --wrap-mode nodownload -D b_lto=true -D b_pie=true build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" ninja install -C build
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
