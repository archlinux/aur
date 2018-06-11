# Contributor: Brett Gilio <owner@brettgilio.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.10.0
pkgrel=2
pkgdesc="The F# Compiler, Core Library & Tools (F# Software Foundation Repository)"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
makedepends=(git)
_commit=76d5288b0b54e20b14a1bf5ca8eb0e9193c5485c  # tags/4.10.0
source=("git+https://github.com/fsharp/fsharp/#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
