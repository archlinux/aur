# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=mod_python2
pkgver=3.5.0
pkgrel=2
pkgdesc="An Apache module that embeds the Python2 interpreter within the server"
arch=('i686' 'x86_64')
url="http://www.modpython.org/"
license=('APACHE')
depends=('apache' 'python2')
conflicts=('mod_python2-legacy' 'mod_python')
install="mod_python.install"
source=("http://dist.modpython.org/dist/mod_python-$pkgver.tgz")
options=('!strip')
md5sums=('2e61621e8d030f535f112d8e739161e2')

build() {
  cd "$srcdir/mod_python-$pkgver"
  sed -i -e "s#git describe --always#echo $pkgrel#" dist/version.sh
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  sed -i -e "s#-Wl[^ ]*#$LDFLAGS#g" src/Makefile
  make
}

package() {
  cd "$srcdir/mod_python-$pkgver"
  install -d "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}
