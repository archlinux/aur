# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=awtfdb
pkgver=0.4.0
pkgrel=1
pkgdesc="Anime Woman's Tagged File Data Base"
arch=('x86_64')
url="https://github.com/lun-4/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('25c9fd70cb982ea6081257d47c936ce1fefd20929b271558ba2aed8cf41632fd')
makedepends=('zig' 'graphicsmagick')
depends=('glibc')

_binaries=(
  'afind'
  'ainclude'
  'als'
  'amv'
  'arm'
  'atags'
  'awtfdb-janitor'
  'awtfdb-manage'
  'awtfdb-metrics'
  'awtfdb-watcher'
  'wrapper-awtfdb'
)

prepare() {
  cd "$pkgname-$pkgver"
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build install --prefix 'out' -Doptimize=ReleaseSafe
}

#check() {
#  cd "$pkgname-$pkgver"
#  zig build test
#}

package() {
  cd "$pkgname-$pkgver"

  for bin in "${_binaries[@]}"; do
    install -Dm0755 "out/bin/$bin" -t "$pkgdir/usr/bin"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
