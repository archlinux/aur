# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pylibemu
pkgname=('python-pylibemu' 'python2-pylibemu')
_pyname=pylibemu
pkgver=0.3.3
pkgrel=1
pkgdesc="A Libemu Cython wrapper"
arch=('any')
url="https://github.com/buffer/pylibemu"
license=('GPL2')
depends=('libemu')
makedepends=('python' 'python2') 
source=("https://github.com/buffer/pylibemu/archive/v${pkgver}.tar.gz")
sha256sums=('86621da66f329e57bdaf230b18617ad22913796f04578027e370ae081d55fbcb')

prepare() {
  cd ${srcdir}
  cp -r ${_pyname}-${pkgver}{,-py2} 
}

check() {
  cd ${srcdir}/${_pyname}-${pkgver}
  python setup.py check
  
  cd ${srcdir}/${_pyname}-${pkgver}-py2
  python2 setup.py check  
}

package_python-pylibemu() {
  depends=('python')
  cd "${srcdir}/pylibemu-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-pylibemu() {
  depends=('python2')
  cd "${srcdir}/pylibemu-${pkgver}-py2"
  python2 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
