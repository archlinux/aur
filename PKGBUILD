# Contributor: Brett Gilio <owner@brettgilio.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.5.0
pkgrel=1
pkgdesc="The F# Compiler, Core Library & Tools (F# Software Foundation Repository)"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
makedepends=(git)
_commit=3de387432de8d11a89f99d1af87aa9ce194fe21b  # tags/4.5.0
source=("git+https://github.com/fsharp/fsharp/#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="/usr" DESTDIR="$pkgdir" install
}
