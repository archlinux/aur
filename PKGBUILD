# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-mwclient
pkgname=('python-mwclient' 'python2-mwclient')
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.8.3
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

sha1sums=('89abee74e58dffd6b95c030285a3c6fef3ca6af5')
sha256sums=('4a776c8797ec79647712e052d6f4fda2ac0edc925aeec71392876c48de98d375')
