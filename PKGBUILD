# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: David Rosenstrauch <darose@darose.net>

#_srcname=todo.txt_cli
#_srcname=todo.txt-cli
pkgname=todotxt
#pkgver=2.13.0
pkgver=2.12.0.post2
pkgrel=2
pkgdesc="Simple and extensible shell script for managing your todo.txt file"
arch=('any')
url="https://github.com/todotxt/todo.txt-cli"
license=('GPL3')
makedepends=('git')
optdepends=('bash-completion: tab completion')
install=$pkgname.install
#source=(https://github.com/todotxt/todo.txt-cli/releases/download/v$pkgver/$_srcname-$pkgver.tar.gz)
#source=($_srcname-$pkgver::https://github.com/todotxt/$_srcname/archive/refs/tags/v$pkgver.tar.gz)
source=($pkgname-$pkgver::git+$url.git#commit=ea32af34e6a0efef59bdf9acaa1c38d5d32bef0d)
sha256sums=('SKIP')

prepare() {
  # Rename completion file to "todo.sh"
  sed -i 's/\(todo_completion.*todo$\)/\1.sh/' $pkgname-$pkgver/Makefile
}

build() {
  make -C $pkgname-$pkgver
}

check() {
  make -C $pkgname-$pkgver test
}

package() {
  make -C $pkgname-$pkgver install CONFIG_DIR="$pkgdir/etc" \
                                   INSTALL_DIR="$pkgdir/usr/bin" \
                                   BASH_COMPLETION="$pkgdir/usr/share/bash-completion/completions"
}

