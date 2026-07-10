# Contributor: redponike <proton (dot) me>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=fancy-cat
pkgver=0.6.0
pkgrel=1
pkgdesc='PDF reader for terminal emulators using the Kitty image protocol'
arch=('x86_64')
url="https://github.com/freref/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6c2c300f92ee6dab31c61a9b6c16cbbac217d8d7bbdfaacbee394539a8355c1a03b59a2cbda4f076c8cb2a91c9532c28d83faf021d1c6a324aa71085a42be385')
depends=('glibc' 'libmupdf')
makedepends=('zig' 'freetype2' 'harfbuzz' 'jbig2dec' 'openjpeg2' 'libjpeg-turbo' 'gumbo-parser' 'mujs' 'zlib')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/            "mupdf-third", "harfbuzz",/            "mupdf", "harfbuzz",/' build.zig
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build install --prefix 'out'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "out/bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
