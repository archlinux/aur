# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-mwclient
pkgname=('python-mwclient' 'python2-mwclient')
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.8.6
pkgrel=1
arch=('any')
url="https://github.com/mwclient/mwclient"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwclient/mwclient/archive/v${pkgver}.tar.gz")

build() {
  cd $srcdir
  cp -r mwclient-$pkgver mwclient2-$pkgver
}

check() {
  cd $srcdir/mwclient-$pkgver
  which python3 && python3 setup.py check

  cd $srcdir/mwclient2-$pkgver
  which python2 && python2 setup.py check
}

package_python-mwclient() {
  depends=('python' 'python-requests-oauthlib')
  cd $srcdir/mwclient-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-mwclient() {
  depends=('python2' 'python2-requests-oauthlib')
  cd $srcdir/mwclient2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha1sums=('e908e0c4650858a41aeaeb1992d5ec7d164547bd')
sha512sums=('620e9726babfb6dbb84032a0e05094e1416d8aa9e1d87f09d6e000acafb3155410a2e7339e7ca88144aebdb542415d3d58d2d67034f4e9c9d664eae7a97e14c6')
