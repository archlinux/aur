# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils
pkgver=0.0.4
pkgrel=1
pkgdesc='Everyday CLI utilities that are easily pipable.'
arch=('x86_64' 'aarch64')
url='https://noraj.github.io/quartz-utils/'
license=('MIT')
depends=()
makedepends=('crystal' 'shards')
source=("https://github.com/noraj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ffacd57746299a2a3b9b338d6feb13c1fd5822d4760293a40b6f8ab1e7b447ee6e2a71da47e583f24eca4b209a027c9e647d5654594213c6ae3802df80ab109a')
b2sums=('305c9b3a5d5d9719446fd0563153e2ded926f74471b757e3461d0f8e2d31d12345a9b974d3f4d4eebab12241c6ef7b46a7af80161b65f9252c03afe68b6f2658')
provides=('quartz-utils')
conflicts=('quartz-utils-bin' 'quartz-utils-git')

build() {
  cd "$pkgname-$pkgver"

  shards install --production
  shards build --production --release --no-debug
  strip bin/*
}

package() {
  cd "$pkgname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/* *.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 755 -t "$pkgdir/usr/bin" bin/*
}
