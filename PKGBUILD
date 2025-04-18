# Contributor: fcying <fcyingmk2@gmail.com>
# Maintainer: JohanChane <johanchanex@gmail.com>
pkgname=compiledb-go-git
pkgver=1.3.0
pkgrel=1
pkgdesc="A Go tool to generate compile_commands.json from Go build commands"
arch=('x86_64' 'aarch64')
url="https://github.com/fcying/compiledb-go"
license=('GPL3')
depends=('go')
makedepends=('git')
conflicts=('compiledb')
provides=('compiledb-go')
source=("$pkgname::git+https://github.com/fcying/compiledb-go.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/cmd/compiledb"
  go build -o compiledb
}

package() {
  cd "$srcdir/$pkgname/cmd/compiledb"
  install -Dm755 compiledb "$pkgdir/usr/bin/compiledb"
}
