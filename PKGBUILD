# Maintainer: Kritias <theodoridisgr at gmail dot com>
# Previous Maintainer: aksr <aksr at t-com dot me>
pkgname=creduce-git
pkgver=2.10.0.96.g8d56bee
pkgrel=1
pkgdesc='A C program reducer.'
arch=('i686' 'x86_64')
url='https://github.com/csmith-project/creduce'
license=('custom:University of Illinois/NCSA Open Source License')
depends=('clang' 'llvm' 'perl-exporter-lite' 'perl-file-which' 'perl-getopt-tabular'
         'perl-regexp-common' 'zlib')
optdepends=('perl-term-readkey')
makedepends=('git')
source=("$pkgname::git+https://github.com/csmith-project/creduce.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/^creduce.//;s|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --libexecdir=/usr/lib/creduce
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

