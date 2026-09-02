# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: David Rosenstrauch <darose@darose.net>

_srcname=todo.txt-cli
pkgname=todotxt
pkgver=2.14.0
pkgrel=1
pkgdesc='Simple and extensible shell script for managing your todo.txt file'
arch=(any)
url=https://github.com/todotxt/todo.txt-cli
license=(GPL-3.0-or-later)
makedepends=(git)
optdepends=('bash-completion: tab completion')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb1a783a24c908419f3b43f855ef5749db7e90ed55ba4cd4cbd9cea2b1537e8c')

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
