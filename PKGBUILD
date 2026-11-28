# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>
pkgname=stalescan
pkgver=0.1.0
pkgrel=1
pkgdesc='Check whether a drive reads old data much more slowly than fresh data'
arch=('any')
url='https://github.com/acrion/stalescan'
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4aad33def1ce0844a2cd885822ab9e857c9fd5cd28cf6349160e785e85f9accc')

check() {
  cd "$pkgname-$pkgver"
  python -B -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 stalescan.py "$pkgdir/usr/bin/stalescan"
  sed -i '1s|^#!/usr/bin/env python3$|#!/usr/bin/python3|' "$pkgdir/usr/bin/stalescan"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
