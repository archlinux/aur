# lifehacker.com's todo.sh script for maintaining a todo.txt file

# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=todotxt-git
pkgver=2.10
pkgrel=3
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="https://github.com/todotxt/todo.txt-cli"
depends=('bash')
conflicts=('todotxt')
install=todotxt.install
source=("${pkgname}"::"git+https://github.com/todotxt/todo.txt-cli"
        "0001-Configurable-config-dir.patch")
sha256sums=('SKIP'
            '580b3d957c114c74a4b6922c46d1f36d0fc2606a2adcca6d24c0bbd21e686065')
arch=('any')
license=("GPL")

prepare() {
   cd $srcdir/$pkgname
   patch -p1 -i $srcdir/0001-Configurable-config-dir.patch
}

package() {
  cd $srcdir/$pkgname
  make
  make install CONFIG_DIR=$pkgdir/etc INSTALL_DIR=$pkgdir/usr/bin BASH_COMPLETION_DIR=$pkgdir/usr/share/bash-completion/completions
  make test
}
