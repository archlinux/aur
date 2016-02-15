pkgname=fipy
pkgver=3.1
pkgrel=2
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib')
makedepends=('python2-distribute' 'python2-setuptools')
optdepends=('gmsh: creation of irregular meshes')
source=(http://www.ctcms.nist.gov/fipy/download/FiPy-${pkgver}.tar.gz
        ez_setup.patch)
sha256sums=('54a4bc2ed6562bd402890ddd257220cf092438db1941427035412813415bd0c7'
            '0eb8d008ff6e5ba97c84cb470f751ba6a2cb28a22e3d64cfe8d74606368f8ae2')

package() {
   cd "${srcdir}/FiPy-${pkgver}"
   # fix building by removing ez_setup references
   patch setup.py ../../ez_setup.patch
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   chmod 644 ${pkgdir}/usr/lib/python*/site-packages/FiPy-${pkgver}-py*.egg-info/*
   install -Dm644 "${srcdir}/FiPy-${pkgver}/LICENSE.txt" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et tw=0:
