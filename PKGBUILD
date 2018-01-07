# Maintainer: Tierry Hörmann <tierryhoermann96 at gmx dot ch>
pkgname=lolang
pkgver=0.1.2_alpha
pkgrel=1
pkgdesc="A dope programming language"
arch=('x86_64')
url="https://github.com/tierriminator/Lolang"
license=('MIT')
groups=()
depends=('swift>=4.0.0' 'llvm>=5.0.0' 'glibc' 'libc++')
makedepends=('git')
source=("https://github.com/tierriminator/Lolang/archive/${pkgver//_/-}.tar.gz")
md5sums=('7f5c10e8ba1490901d2124f54ef51e19')



build() {
  repdir="$srcdir/Lolang-${pkgver//_/-}"
  cd $repdir
  sudo swift utils/make-pkgconfig.swift
  swift build -c release
}

check() {
  cd $repdir
  swift test
}

package() {
  repdir="$srcdir/Lolang-${pkgver//_/-}"
  mkdir -p "$pkgdir/usr/bin"
  mv "$repdir/.build/release/lolc" "$pkgdir/usr/bin"  
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$repdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
