# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: Whyme Lyu <callme5long@gmail.com>
# Contributor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

_pkgname=bbcp
pkgname=bbcp-git
pkgver=17.12.00.00.0
pkgrel=1
pkgdesc="A high-performance network file copy application."
arch=('x86_64')
url="https://www.slac.stanford.edu/~abh/bbcp/"
license=('LGPL3')
depends=('openssl' 'zlib' 'openssh')
makedepends=('git')
source=('git+https://www.slac.stanford.edu/%7Eabh/bbcp/bbcp.git/')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname/src"
  sed -i.bak -e 's/uname -i/uname -m/' Makefile
  make ENVCFLAGS="-Dunix -D_BSD -D_ALL_SOURCE -std=c++14"
}

package() {
  cd "$srcdir/$_pkgname"
  osver=`./MakeSname`
  install -Dm 755 "$srcdir/$_pkgname/bin/$osver/bbcp" "$pkgdir/usr/bin/bbcp"
}
