# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python-bokeh'
pkgname=('python-bokeh' 'python2-bokeh')
pkgver=0.11.0
pkgrel=2
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
md5sums=('16064e126b7c0ca4cce03506dd1b4d30')

build() {
  cp -r "${srcdir}"/bokeh-$pkgver "${srcdir}"/bokeh-$pkgver-py2

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py build

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py build
} 

package_python-bokeh() {
  depends=('python-numpy'
         'python-flask'
         'redis'
         'python-redis'
         'python-requests'
         'python-pandas'
         'python-yaml'
         'python-tornado')

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --build_js
}

package_python2-bokeh() {
  depends=('python2-numpy'
         'python2-flask'
         'redis'
         'python2-redis'
         'python2-requests'
         'python2-gevent-websocket'
         'python2-pandas'
         'python2-yaml'
         'python2-tornado')

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1 --build_js
  sed -i "s|python|python2|g" "${pkgdir}"/usr/bin/bokeh
  mv "${pkgdir}"/usr/bin/bokeh "${pkgdir}"/usr/bin/bokeh2
  mv "${pkgdir}"/usr/bin/bokeh-server "${pkgdir}"/usr/bin/bokeh-server2
}


