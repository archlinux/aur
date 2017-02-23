# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2016.3.28
pkgrel=3
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/erocarrera/pefile/archive/v${pkgver}.tar.gz")
sha512sums=('f14693753f74d427591224ca6e0360087fb1961bbbd22ad3a99182ab5153a9845c400bcd1e0a267b930edab8ac36640e2bd97484700ce9bb36a046b2ec4f122e')

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
  LC_CTYPE=en_US.UTF-8 python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-pefile() {
  depends=('python2' 'python2-future')
  cd "${srcdir}/pefile2-${pkgver}"
  LC_CTYPE=en_US.UTF-8 python2 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
