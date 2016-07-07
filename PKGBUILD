# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python-bokeh'
pkgname=('python-bokeh' 'python2-bokeh')
pkgver=0.12.0
pkgrel=1
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
# source=("https://pypi.python.org/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/45/c7/c0738637a16e4174ab7ec5f7f487786b9217846f1f2245358e368633682e/bokeh-0.12.0.tar.gz")
sha1sums=('001354fc1db39859c3714a0df0e9dc717efffac4')

build() {
  cp -r "${srcdir}"/bokeh-$pkgver "${srcdir}"/bokeh-$pkgver-py2

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py build --build_js

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py build --build_js
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

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --install_js
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

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1 --install_js
  sed -i "s|python|python2|g" "${pkgdir}"/usr/bin/bokeh
  mv "${pkgdir}"/usr/bin/bokeh "${pkgdir}"/usr/bin/bokeh2
  mv "${pkgdir}"/usr/bin/bokeh-server "${pkgdir}"/usr/bin/bokeh-server2
}


