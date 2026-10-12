# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zune
pkgver=0.5.9
pkgrel=1
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
makedepends=('zig')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('201a00304acc82b15b5e9d152ff6026ad5fbd555c51ad835076b7970460e96d5')

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
