# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
# Contributor: Brandon Invergo <brandon@brandoninvergo.com>
pkgname=python2-pyifbabel
pkgver=0.4
pkgrel=2
pkgdesc="A pure-Python implementation of the Treaty of Babel for interactive fiction"
arch=('any')
url="http://pyifbabel.invergo.net"
license=('GPL')
depends=('python2')
source=("http://pyifbabel.invergo.net/download/${pkgname##python2-}-$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('38c7f1b3163b6ddd6591b1f8fce028ea983637a9dec8c3626aac21c3c536c30e'
            '964e0d395ad8232ba8ca3e017cc5e01817e14a01ffaa5a9db24ff42ebfa099ba')


prepare() {
  cd "$srcdir"
  patch -Np1  -i "$pkgname.patch" "${pkgname#python2-}-$pkgver/setup.py"
}
build() {
  cd "$srcdir/${pkgname##python2-}-$pkgver"
  python2 setup.py build
}


package() {
  cd "$srcdir/${pkgname##python2-}-$pkgver"
  python2 setup.py install --root="$pkgdir/"  --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
