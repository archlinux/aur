# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=macros
pkgver=0.1.0
pkgrel=1
pkgdesc='A libcosmic app to manage and run macros on Linux.'
url='https://github.com/EthanRStokes/macros'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('rust' 'git')
depends=('expat' 'fontconfig' 'libxkbcommon')
conflicts=('macros')
provides=('macros')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EthanRStokes/macros/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b3c2633525efc6803ee369fa5409c5cd6d8bcd732ada396564646cf47fe786c5')
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
}
