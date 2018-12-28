# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=googleplaydownloader
pkgver=2.3
pkgrel=2
pkgdesc="A graphical software to download APKs from the Google Play store."
arch=(any)
url="https://framagit.org/tuxicoman/googleplaydownloader"
license=('AGPL')
depends=('python2'
         'python2-requests'
         'python2-pyasn1'
         'wxpython')
makedepends=('git' 'python2-setuptools')
source=("git+https://framagit.org/tuxicoman/googleplaydownloader.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  sed -i 's/dist/site/' "$pkgname/debian/wrapper/$pkgname"
}

package() {
  cd "$pkgname" || exit
  python2 setup.py install --root="$pkgdir" --optimize=1

  cd debian || exit
  install -Dm755 "wrapper/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
