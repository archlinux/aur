pkgname=python-doc2dash
pkgver=2.3.0
pkgrel=1
pkgdesc="Create docsets for Dash.app-compatible API browser."
url="https://doc2dash.readthedocs.io/en/stable/"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-sphinx' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-colorama' 'python-lxml' 'python-six' 'python-zope-interface')
source=("https://github.com/hynek/doc2dash/archive/${pkgver}.tar.gz")
sha256sums=('f383d58ff3b623bda760685173c63c9130f34c6c515ba100ef5c5f7c9a2fcaaf')

prepare ()
{
  cd "${srcdir}"/doc2dash-${pkgver}
  # unpin dependencies
  sed -i "s|==\([0-9]\)|>=\1|g" setup.py
}

build() {
  cd "${srcdir}"/doc2dash-${pkgver}
  python setup.py build
}

package() {
  depends=('python-sphinx' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-colorama' 'python-lxml' 'python-six' 'python-zope-interface')
  provides=('python-doc2dash')

  cd "${srcdir}/doc2dash-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
