# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gn-m85
pkgver=0.1792.7d7e8dee
_commit=7d7e8deea36d126397bda2cf924682504271f0e1
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
pkgdesc+=" (version shipped in Chromium 85; for apps not ported to use frameworks to list framework dependencies; https://gn-review.googlesource.com/c/gn/+/9240)"
arch=('x86_64')
url="https://gn.googlesource.com/gn/"
license=('BSD')
depends=('gcc-libs')
makedepends=('clang' 'ninja' 'python' 'git')
source=(git+https://gn.googlesource.com/gn#commit=$_commit)
md5sums=('SKIP')

pkgver() {
  cd gn
  echo 0.$(git rev-list --count initial-commit..).$(git rev-parse --short HEAD)
}

build() {
  cd gn
  ./build/gen.py
  ninja -C out
}

check() {
  cd gn
  ./out/gn_unittests
}

package() {
  cd gn
  install -D out/gn "$pkgdir/usr/bin/gn-m85"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
