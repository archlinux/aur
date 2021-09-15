# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-xmlformatter
pkgname=(python-xmlformatter python2-xmlformatter)
pkgver=0.2.4
pkgrel=1
pkgdesc="Provides formatting of XML documents"
arch=('any')
url="https://github.com/pamoller/xmlformatter"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/x/xmlformatter/xmlformatter-$pkgver.tar.gz")
sha256sums=('6d93c4bc04cffb1d4cf6eb9d9034018e9b264e4554269e7da67539ba4bff03f5')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -a "xmlformatter-$pkgver" "xmlformatter-$pkgver-py2"
}

# package for python 3
package_python-xmlformatter() {
  depends=('python')

  cd "xmlformatter-$pkgver"
  python -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# package for python 2
package_python2-xmlformatter() {
  depends=('python2')

  cd "xmlformatter-$pkgver-py2"
  python2 -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # non-conflicting executable name
  mv "$pkgdir"/usr/bin/xmlformat "$pkgdir"/usr/bin/xmlformat-py2
}
