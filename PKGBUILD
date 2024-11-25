# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Allen Zhong <moeallenz@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
_hash=b068800c425e00ca447de8bbe664650fedaf3b4a
pkgname=mod_python
pkgver=3.5.0.4
pkgrel=1
pkgdesc="An Apache module that embeds the Python interpreter within the server"
arch=('i686' 'x86_64')
url="http://www.modpython.org/"
license=('APACHE')
depends=('apache' 'python')
makedepends=('python-setuptools')
conflicts=('mod_python2-legacy' 'mod_python2')
install="$pkgname.install"
source=(mod_python-$_hash.zip::https://github.com/grisha/mod_python/archive/$_hash.zip)
options=('!strip')
md5sums=('36732e22d38db6b85a3d5355271cf40a')

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

