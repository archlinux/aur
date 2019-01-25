# Maintainer: Pierpaolo Valerio <gondsman@techgeek.co.in>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python-bokeh'
pkgname=('python-bokeh' 'python2-bokeh')
pkgver=1.0.4
pkgrel=1
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' python-numpy python-six python-flask python-jinja python-requests python-pandas python-yaml python-tornado python2-numpy python2-six python2-flask python2-jinja python2-requests python2-pandas python2-yaml python2-tornado)
source=("https://pypi.io/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
sha256sums=('ceeb6a75afc1b2de00c2b8b6da121dec3fb77031326897b80d4375a70e96aebf')

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
	 'python-pillow'
         'python-yaml'
         'python-tornado')
  optdepends=('python-bkcharts: server'
	 'phantomjs: svg export')

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
	 'python2-pillow'
         'python2-yaml'
         'python2-tornado')
  optdepends=('python2-bkcharts: server'
	 'phantomjs: svg export')

  cd "${srcdir}"/bokeh-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1

  sed -i "s|python|python2|g" "${pkgdir}"/usr/bin/bokeh
  mv "${pkgdir}"/usr/bin/bokeh "${pkgdir}"/usr/bin/bokeh2
}


