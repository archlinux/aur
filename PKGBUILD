# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=fancy-cat
pkgver=0.1.1
pkgrel=1
pkgdesc='PDF reader for terminal emulators'
arch=('x86_64')
url="https://github.com/freref/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d07869f94eb6105a52684e13f67f3d844ea1bc54183dfeee20eb4f8f51524ce')
depends=('glibc' 'libmupdf')
makedepends=('zig=0.13.0'
  'freetype2' 'harfbuzz' 'jbig2dec' 'openjpeg2' 'libjpeg-turbo' 'gumbo-parser' 'mujs' 'zlib')

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
