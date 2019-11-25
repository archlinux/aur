# Maintainer: Pierpaolo Valerio <gondsman@techgeek.co.in>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python2-bokeh'
pkgname=('python2-bokeh')
pkgver=1.4.0
pkgrel=1
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
source=("https://pypi.io/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
sha256sums=('c60d38a41a777b8147ee4134e6142cea8026b5eebf48149e370c44689869dce7')

build() {
  cd "${srcdir}"/bokeh-$pkgver
  python2 setup.py build
} 

package_python2-bokeh() {
  depends=('python2-numpy'
         'python2-six'
         'python2-flask'
         'python2-jinja'
         'python2-requests'
	 'python2-pillow'
         'python2-yaml'
         'python2-tornado')
  optdepends=('python2-bkcharts: server'
	 'phantomjs: svg export'
	 'nodejs: extending Bokeh'
	 'python2-pandas: Pandas support'
	 'python2-psutil: detailed memory logging'
	 'python2-networkx: plot directly from NetworkX data'
	 'python2-sphinx: support sphinx documentation')

  cd "${srcdir}"/bokeh-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1

  sed -i "s|python|python2|g" "${pkgdir}"/usr/bin/bokeh
  mv "${pkgdir}"/usr/bin/bokeh "${pkgdir}"/usr/bin/bokeh2
}


