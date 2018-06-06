# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-mwclient
pkgname=('python-mwclient' 'python2-mwclient')
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.9.0
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

sha512sums=('cf227cdab53d6344e4559d6082a49e1d61808e1cd5ad18d7be5b005d4a36851669f1182d63882ca7955a8f79116f4270dcfc2435c12ff33af41faf984842b964')
