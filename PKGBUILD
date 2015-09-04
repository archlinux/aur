# Maintainer: crito <crito@cryptodrunks.net>
pkgname=python2-txzmq
pkgver=0.7.4
pkgrel=2
pkgdesc="ZeroMQ bindings for Twisted."
arch=('any')
url="https://github.com/smira/txZMQ"
license=('GPL2')
depends=('python2>=2.7' 'zeromq' 'python2-pyzmq>=13.0' 'python2-twisted>=10.0')
makedepends=('python2-sphinx' 'make')
source=("https://github.com/smira/txZMQ/archive/${pkgver}.tar.gz")
md5sums=('b95ee236c1b6253006170be81fcee2d7')

package() {
  cd "${srcdir}/txZMQ-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 AUTHORS.txt "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  # Build the docs as well - Fails now because two doctests fail
  cd "${srcdir}/txZMQ-${pkgver}/docs"
  make SPHINXBUILD=/usr/bin/sphinx-build2 html
  cp -a _build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
