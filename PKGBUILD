# lifehacker.com's todo.sh script for maintaining a todo.txt file

# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=todotxt-git
pkgver=v2.11.0.r37.g2d70a0a
pkgrel=1
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="https://github.com/todotxt/todo.txt-cli"
depends=('bash')
conflicts=('todotxt')
install=todotxt.install
makedepends=(git)
source=("${pkgname}"::"git+https://github.com/todotxt/todo.txt-cli")
sha256sums=('SKIP')
arch=('any')
license=("GPL")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$pkgname
  make
  make install prefix=$pkgdir/usr CONFIG_DIR=$pkgdir/etc INSTALL_DIR=$pkgdir/usr/bin BASH_COMPLETION_DIR=$pkgdir/usr/share/bash-completion/completions
  make test
}
