# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2017.11.5
pkgrel=1
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/erocarrera/pefile/archive/v${pkgver}.tar.gz")
sha512sums=('820f7770d18256857436698a9d72276dc8089a2a85c20f1c2e284c541680879016f7acf7b3029e7dd1f32ef093b52fe1c8e8f7962e5b9a7dbbc0f94caf6d0d66')

prepare() {
  cd "${srcdir}"
  cp -r pefile-"${pkgver}" pefile2-"${pkgver}"
}

# currently disabled because of missing files in the tarball
#check() {
#  cd "${srcdir}/pefile-${pkgver}"
#  LC_CTYPE=en_US.UTF-8 python setup.py test
#
#  cd "${srcdir}/pefile2-${pkgver}"
#  LC_CTYPE=en_US.UTF-8 python2 setup.py test
#}

package_python-pefile() {
  depends=('python' 'python-future')
  cd "${srcdir}/pefile-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-pefile() {
  depends=('python2' 'python2-future')
  cd "${srcdir}/pefile2-${pkgver}"
  python2 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
