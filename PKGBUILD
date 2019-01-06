# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

_name=sphinxcontrib-katex
pkgbase=python-sphinxcontrib-katex
pkgname=('python-sphinxcontrib-katex' 'python2-sphinxcontrib-katex')
pkgver=0.4.0
pkgrel=1
pkgdesc='A Sphinx extension for rendering math in HTML pages.'
arch=('any')
url='https://github.com/hagenw/sphinxcontrib-katex'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('47c2b2f7b1d8bdf3b32629c45ae1e94354d2a2ba7381c7acfea081abb9081063')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
}

package_python-sphinxcontrib-katex() {
  depends=('python-sphinx')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # doc
  install -vDm644 README.rst "${pkgdir}/usr/share/doc/${pkgname[0]}/README.rst"
}

package_python2-sphinxcontrib-katex() {
  depends=('python2-sphinx')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
  # doc
  install -vDm644 README.rst "${pkgdir}/usr/share/doc/${pkgname[1]}/README.rst"
}

