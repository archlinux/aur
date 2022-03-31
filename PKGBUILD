# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=nspirefs-fuse-git
pkgver=6.70cbdfe
pkgrel=1
pkgdesc="Fuse filesystem for TI-Nspire calculators"
arch=('any')
url=https://github.com/antonilol/nspirefs-fuse
license=('MIT')
source=("nspirefs-fuse::git+$url")
md5sums=('SKIP')
depends=('fuse' 'nodejs' 'nspire-tools-git')
makedepends=('git' 'npm')

build() {
  cd "$srcdir"/nspirefs-fuse
  npm i
  npm run build
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,lib}
  cp -r "$srcdir"/nspirefs-fuse "$pkgdir"/usr/lib/"$pkgname"
  sed -i '1s;^;#!/usr/bin/env node\n\n;' "$pkgdir"/usr/lib/"$pkgname"/nspirefs-fuse.js
  ln -sr "$pkgdir"/usr/lib/"$pkgname"/nspirefs-fuse.js "$pkgdir"/usr/bin/nspirefs-fuse
}
