# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune
pkgver=0.5.2
pkgrel=1
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
makedepends=('zig')
arch=('x86_64' 'aarch64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a137b3892108b1a403ba3cd9776216632a45cdb554541a986f91715d63f88aa6')

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
