# Maintainer: Simon Boulay <simon.boulay@alkeona.net>
# Contributor: Melvin Vermeeren <mail@mel.vin>

_name=sphinxcontrib-tikz
pkgname=("python-${_name}" "python2-${_name}")
pkgver=0.4.4
pkgrel=2
pkgdesc="TikZ extension for Sphinx."
arch=('any')
url="https://bitbucket.org/philexander/tikz"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
       sphinxcontrib-tikz-sphinx1.7-fix.diff)
sha256sums=('755a88072f7d3591846a3190f208d662bde84640b18bdea358a1358e895757ff'
            '276e04bfbca4086331cb9a135c87af1bd8a7219aa942743cbdb398fcb3741c92')

prepare() {
  cd "sphinxcontrib-tikz-$pkgver"

  patch -p1 < "${srcdir}/sphinxcontrib-tikz-sphinx1.7-fix.diff"

  cp -a "${srcdir}/sphinxcontrib-tikz-$pkgver" "${srcdir}/sphinxcontrib-tikz2-$pkgver"
}

package_python-sphinxcontrib-tikz() {
  depends=('python' 'python-setuptools')

  cd "sphinxcontrib-tikz-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-tikz() {
  depends=('python2' 'python2-setuptools')

  cd "sphinxcontrib-tikz2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
