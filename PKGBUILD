# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

pkgbase=python-latex
pkgname=('python-latex' 'python2-latex')
pkgver=0.7.0
pkgrel=1
pkgdesc="Python wrappers for calling LaTeX/building LaTeX documents"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/latex/${pkgver}"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("latex-$pkgver.tar.gz::https://github.com/mbr/latex/archive/$pkgver.tar.gz")
md5sums=('d2233004214b75484aae5b0d8d220720')

prepare() {
  cp -a "$srcdir/latex-$pkgver" "$srcdir/latex-$pkgver-python2"

  find "$srcdir/latex-$pkgver-python2" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "$srcdir/latex-$pkgver"
  python setup.py build

  cd "$srcdir/latex-$pkgver-python2"
  python2 setup.py build
}

package_python-latex() {
  depends=('python' 'python-setuptools' 'python-data'
           'python-tempdir' 'python-future' 'python-shutilwhich'
           'python-six')
  cd "$srcdir/latex-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-latex() {
  depends=('python2' 'python2-setuptools' 'python2-data'
           'python2-tempdir' 'python2-future' 'python2-shutilwhich'
           'python2-six')
  cd "$srcdir/latex-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" --optimize=1
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

