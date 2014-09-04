# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-xmlformatter
pkgname=(python-xmlformatter python2-xmlformatter)
pkgver=0.1.1
pkgrel=1
pkgdesc="Provides formatting of XML documents"
arch=('any')
url="http://pamoller.com/xmlformatter.html"
license=('custom: MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/source/x/xmlformatter/xmlformatter-$pkgver.tar.gz")
sha256sums=('1897b8c7868860d4b02c450d2f208391cb6f18bf60102ab0d89703b3088280e2')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup xmlformatter-$pkgver xmlformatter-$pkgver-py2
}

# package for python 3
package_python-xmlformatter() {
  depends=('python')
  pkgdesc+=" (python3 version)"

  cd xmlformatter-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# package for python 2
package_python2-xmlformatter() {
  depends=('python2')
  pkgdesc+=" (python2 version)"

  cd xmlformatter-$pkgver-py2

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

  # non-conflicting executable name
  mv "$pkgdir"/usr/bin/xmlformat "$pkgdir"/usr/bin/xmlformat-py2
}
