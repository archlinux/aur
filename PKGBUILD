# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune
pkgver=0.5.1
pkgrel=1
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
makedepends=('zig')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4abacd74a5e39c824ec6c4c0e3685e0576db856eb72695c0aa98c260f39330a')

prepare() {
    cd "$pkgname-$pkgver"
    zig build --fetch
}

build() {
    cd "$pkgname-$pkgver"
    zig build install --prefix 'out' -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "out/bin/zune" "$pkgdir/usr/bin/zune"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
