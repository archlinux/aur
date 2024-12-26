# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: David Rosenstrauch <darose@darose.net>

_srcname=todo.txt-cli
pkgname=todotxt
pkgver=2.13.0
pkgrel=1
pkgdesc='Simple and extensible shell script for managing your todo.txt file'
arch=(any)
url=https://github.com/todotxt/todo.txt-cli
license=(GPL-3.0-or-later)
makedepends=(git)
optdepends=('bash-completion: tab completion')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('848a07b7dc9a156bea372922a0cfafc9e761c9b18d8b0809703bc1bc98363605')

prepare() {
  # Rename completion file to "todo.sh"
  sed -i 's/\(todo_completion.*todo$\)/\1.sh/' $_srcname-$pkgver/Makefile
}

build() {
  make -C $_srcname-$pkgver
}

check() {
  make -C $_srcname-$pkgver test
}

package() {
  make -C $_srcname-$pkgver install \
    CONFIG_DIR="$pkgdir/etc" \
    INSTALL_DIR="$pkgdir/usr/bin" \
    BASH_COMPLETION="$pkgdir/usr/share/bash-completion/completions"
}
