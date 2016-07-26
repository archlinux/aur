# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=googleplaydownloader
_svnrev=72
pkgver=2.0
pkgrel=2
pkgdesc="A graphical software to download APKs from the Google Play store."
arch=(any)
url="https://codingteam.net/project/$pkgname"
license=('AGPL')
depends=('python2'
         'python2-configparser'
         'python2-protobuf'
         'python2-requests'
         'wxpython'
         'python2-ndg-httpsclient')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
makedepends=('subversion'
             'python2-setuptools')
source=("$pkgname-$pkgver::svn+http://svn.codingteam.net/$pkgname#revision=$_svnrev")
sha256sums=('SKIP')

prepare() {
  sed -i 's/dist/site/' $pkgname-$pkgver/debian/wrapper/$pkgname
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  cd debian
  install -Dm755 wrapper/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.xpm "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
