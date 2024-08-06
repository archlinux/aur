# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils
pkgver=0.0.3
pkgrel=1
pkgdesc='Everyday CLI utilities that are easily pipable.'
arch=('x86_64' 'aarch64')
url='https://noraj.github.io/quartz-utils/'
license=('MIT')
depends=()
makedepends=('crystal' 'shards')
source=("https://github.com/noraj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('408d58fdb7fc5bbe9e7513d4cb4146552c083b574b016e0778c5a806d9b3cb9f5b0cf9b8d0b4490c51f7b7b0823cccb4b606efdc865e17aa875a3ed0f8cc7c08')
b2sums=('79a7b159919b84be5709374b801c76acf8c1791f1b514fd38270e3ef536b05d2370c774b0613ad8da8582cbfc209ee12668dfb145e7208427c5bd10e65713efd')
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
