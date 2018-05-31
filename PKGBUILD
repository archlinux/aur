# Maintainer: Brett Gilio <owner@brettgilio.com>

pkgname=fsharp-stable
pkgver=4.1.34
pkgrel=1
pkgdesc="The F# Foundation Compiler, Core Library, Tools, and SDK"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
makedepends=(git)
_commit=662492595a63dffff8fac84939614743fd6d34f9  # tags/4.1.34
source=("git+https://github.com/fsharp/fsharp/#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd fsharp
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/fsharp"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/fsharp"
  make DESTDIR="$pkgdir" install
}
