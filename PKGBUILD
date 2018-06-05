# Contributor: Brett Gilio <owner@brettgilio.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.1.34
pkgrel=1
pkgdesc="The F# Compiler, Core Library & Tools (F# Software Foundation Repository)"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
makedepends=(git)
_commit=662492595a63dffff8fac84939614743fd6d34f9  # tags/4.1.34
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
