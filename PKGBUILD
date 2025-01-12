# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=jpu
pkgver=0.0.1
pkgrel=1
pkgdesc='JuleProtonUp is a fast and lightweight ProtonUp alternative'
arch=('x86_64')
url="https://github.com/adamperkowski/$pkgname"
license=('BSD-3-Clause')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('231ba539d1160723e557f967f7986fb5f7884ff012e76fbe4631803dae908f76')
makedepends=('julec' 'git')
depends=('glibc' 'gcc-libs' 'openssl' 'curl')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule update --init
}

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
