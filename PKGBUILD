pkgbase=python-doc2dash
pkgname=('python-doc2dash' 'python2-doc2dash')
pkgver=2.2.0
pkgrel=1
pkgdesc="Create docsets for Dash.app-compatible API browser."
url="https://doc2dash.readthedocs.io/en/stable/"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-colorama' 'python-lxml' 'python-six' 'python-zope-interface' 'python2-sphinx' 'python2-attrs' 'python2-beautifulsoup4' 'python2-click' 'python2-colorama' 'python2-lxml' 'python2-six' 'python2-zope-interface')
source=("https://github.com/hynek/doc2dash/archive/${pkgver}.tar.gz")
sha1sums=('1ec6ed6eefacc0a86907e0a3c6d85e5ffb0285ca')


prepare ()
{
  cd "${srcdir}"/doc2dash-${pkgver}
  # unpin dependencies
  sed -i "s|==\([0-9]\)|>=\1|g" setup.py
}

build() {
  cp -r "${srcdir}"/doc2dash-${pkgver} "${srcdir}"/doc2dash-${pkgver}-py2

  cd "${srcdir}"/doc2dash-${pkgver}
  python setup.py build

  cd "${srcdir}"/doc2dash-${pkgver}-py2
  python2 setup.py build
}

package_python-doc2dash() {
  depends=('python-sphinx' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-colorama' 'python-lxml' 'python-six' 'python-zope-interface')
  provides=('python-doc2dash')

  cd "${srcdir}/doc2dash-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-doc2dash() {
  depends=('python2-sphinx' 'python2-attrs' 'python2-beautifulsoup4' 'python2-click' 'python2-colorama' 'python2-lxml' 'python2-six' 'python2-zope-interface')
  provides=('python2-doc2dash')

  cd "${srcdir}/doc2dash-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
  mv ${pkgdir}/usr/bin/doc2dash ${pkgdir}/usr/bin/doc2dash2
}
