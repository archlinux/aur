# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils
pkgver=0.0.2
pkgrel=1
pkgdesc='Everyday CLI utilities that are easily pipable.'
arch=('x86_64' 'aarch64')
url='https://noraj.github.io/quartz-utils/'
license=('MIT')
depends=()
makedepends=('crystal' 'shards')
source=("https://github.com/noraj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('10aa7e70ab8ece5b712250ace8ae83ea81fded84d28281e5e20f8b359051922fc4adae88c11bb1c135d14f1c3cfef33efeb647da087e409337e8022c0e535ac5')
b2sums=('72dc0d428c8ea8ba1e7cab549b1dd30762967f88be996f4749e6b2f45c217aad642e7f2afcbe117708117273fdf71c161c90e31a455738292f85b970156696e0')
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
