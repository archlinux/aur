# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Allen Zhong <moeallenz@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
_hash=a638e01b7eb50d0cf127ac14c3e1b64347ee682e
pkgname=mod_python
pkgver=3.5.0.7
pkgrel=1
pkgdesc="An Apache module that embeds the Python interpreter within the server"
arch=('i686' 'x86_64')
url="https://www.modpython.org/"
license=('APACHE')
depends=('apache' 'python')
makedepends=('python-setuptools')
conflicts=('mod_python2-legacy' 'mod_python2')
install="$pkgname.install"
source=(mod_python-$_hash.zip::https://github.com/grisha/mod_python/archive/$_hash.zip)
options=('!strip')
md5sums=('aa8a737b989c5d1b4c224d79f0be9bb1')

build() {
  cd "$srcdir/$pkgname-$_hash"
  sed -i -e "s#git describe --always#echo $pkgrel#" dist/version.sh
  ./configure --prefix=/usr --with-python=/usr/bin/python
  sed -i -e "s#-Wl[^ ]*#$LDFLAGS#g" src/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$_hash"
  install -d "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}

