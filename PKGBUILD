# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=macros
pkgver=0.3.1
pkgrel=1
pkgdesc='A libcosmic app to manage and run macros on Linux.'
url='https://github.com/EthanRStokes/macros'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
depends=(
    'expat' 'fontconfig' 'libxkbcommon' 'freetype2' 'hicolor-icon-theme' 'cosmic-icon-theme'
    'libgcc' 'glibc'
    "libx11" "libxi" "libxtst"
)
conflicts=('macros')
provides=('macros')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EthanRStokes/macros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b47feb99937f01f6750ddb0630c4e4a5bd3041f7a3144a37fd54a01fe34d283b')
options=('!lto')

prepare() {
    cd "$srcdir/Macros-$pkgver"

    cargo fetch
}

build() {
    cd "$srcdir/Macros-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/Macros-$pkgver"
    install -Dm755 "target/release/macros" "$pkgdir"/usr/bin/macros

    install -Dm644 "res/icons/macros.png" "$pkgdir"/usr/share/icons/hicolor/256x256/apps/macros.png
    install -Dm644 "res/macros.desktop" "$pkgdir"/usr/share/applications/macros.desktop

    install -Dm644 "res/icons/remove.svg" "$pkgdir"/usr/share/macros/icons/remove.svg
    install -Dm644 "res/icons/up.svg"     "$pkgdir"/usr/share/macros/icons/up.svg
    install -Dm644 "res/icons/down.svg"   "$pkgdir"/usr/share/macros/icons/down.svg
}
