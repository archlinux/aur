# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python-bokeh'
pkgname=('python-bokeh' 'python2-bokeh')
pkgver=0.12.16
pkgrel=1
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' python-numpy python-six python-flask python-jinja python-requests python-pandas python-yaml python-tornado python2-numpy python2-six python2-flask python2-jinja python2-requests python2-pandas python2-yaml python2-tornado)
source=("https://pypi.io/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
sha256sums=('de14151c7ef768f858f46168546c1d492cb04ab3c58bc118329a78ebf35b4688')

build() {
  cp -r "${srcdir}"/bokeh-$pkgver "${srcdir}"/bokeh-$pkgver-py2

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py build

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py build
} 

package_python-bokeh() {
  depends=('python-numpy'
         'python-six'
         'python-flask'
         'python-jinja'
         'python-requests'
         'python-pandas'
         'python-yaml'
         'python-tornado')
  optdepends=('python-bkcharts: server')

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-bokeh() {
  depends=('python2-numpy'
         'python2-six'
         'python2-flask'
         'python2-jinja'
         'python2-requests'
         'python2-pandas'
         'python2-yaml'
         'python2-tornado')
  optdepends=('python2-bkcharts: server')

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1

  sed -i "s|python|python2|g" "${pkgdir}"/usr/bin/bokeh
  mv "${pkgdir}"/usr/bin/bokeh "${pkgdir}"/usr/bin/bokeh2
}


