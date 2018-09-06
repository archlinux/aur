# Contributor: Brett Gilio <owner@brettgilio.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.5_pre
pkgrel=1
pkgdesc="The F# Compiler, Core Library & Tools (F# Software Foundation Repository)"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
makedepends=(git)
_commit=32505e2035ebf3ae3267c1eb2afad8800a7106f8  # tags/4.5_pre
source=("git+https://github.com/fsharp/fsharp/#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  ../autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
