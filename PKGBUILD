# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=roblox-blink
pkgver=0.18.4
pkgrel=2
pkgdesc="An IDL compiler written in Luau for ROBLOX buffer networking"
arch=('x86_64' 'aarch64')
options=(!strip)
url="https://github.com/1Axen/blink"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('darklua' 'lune')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7598bd536e0637967bfea094ec9a2ac8ac48b622842499be4a6a41c9e47087e1')

build() {
    cd "blink-$pkgver"

    darklua process --config build/.darklua.json src/CLI/init.luau release/blink.luau
    lune build release/blink.luau --output release/blink --target "linux-$CARCH"
}

package() {
    cd "blink-$pkgver"

    install -Dm755 release/blink "$pkgdir/usr/bin/blink"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
