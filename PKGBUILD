# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=godots
pkgver=1.4.2.stable
pkgrel=3
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=('MIT')
arch=('x86_64')
depends=('unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MakovWait/godots/archive/refs/tags/v$pkgver.tar.gz")
makedepends=('godot' 'godot-export-templates-linux')
options=('!strip' '!debug')
sha256sums=('e7d49fe689770b69240d9b85f05b1fd81598f654fc49c31c972ef6720dee29df')

build() {
    mkdir -p data/godot
    ln -sfn /usr/share/godot/export_templates data/godot/export_templates
    cd "$pkgname-$pkgver"

    mkdir -p build
    rm -rf tests
    XDG_DATA_HOME="$srcdir/data" godot --headless --export-release "Linux/X11" build/godots
}

package() {
    install -Dm755 "$pkgname-$pkgver/build/godots" "$pkgdir/usr/bin/godots"

    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
    install -Dm644 "$pkgname-$pkgver/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
