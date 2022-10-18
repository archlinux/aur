# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gn-m87
pkgver=0.1831.e002e68a
_commit=e002e68a48d1c82648eadde2f6aafa20d08c36f2
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
pkgdesc+=" (version shipped in Chromium 87; for apps using the set_sources_assignment_filter function; https://crbug.com/1018739)"
arch=('x86_64')
url="https://gn.googlesource.com/gn/"
license=('BSD')
depends=('gcc-libs')
makedepends=('clang' 'ninja' 'python' 'git')
source=(git+https://gn.googlesource.com/gn#commit=$_commit)
sha256sums=('SKIP')

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
  install -D out/gn "$pkgdir/usr/bin/gn-m87"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
