# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=astroterm
pkgver=1.0.7
pkgrel=1
pkgdesc='A planetarium for your terminal'
arch=('x86_64')
url="https://github.com/da-luce/$pkgname"
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname-BSC5-$pkgver::https://web.archive.org/web/20231007085824if_/http://tdc-www.harvard.edu/catalogs/BSC5"
)
sha256sums=('3b8b1597afb31d1cb8ad54030b5766652b4d3f42f0a3d510bbc3191c0c6a4aa5'
            'e471d02eaf4eecb61c12f879a1cb6432ba9d7b68a9a8c5654a1eb42a0c8cc340')
makedepends=('gcc' 'meson' 'ninja' 'xxd')
depends=('glibc' 'ncurses' 'argtable')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p data
  cp "$srcdir/$pkgname-BSC5-$pkgver" data/bsc5
  meson setup build
}

build() {
  cd "$pkgname-$pkgver"
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
