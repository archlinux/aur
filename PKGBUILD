# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2017.9.3
pkgrel=1
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/erocarrera/pefile/archive/v${pkgver}.tar.gz")
sha512sums=('b4e3737608b3e76c450be456b81ab9ea9fc18b1b87fef5d55012fda4fc2cdf2ed4ec052c6f43abb3ced7c79f46fde04160b5d52c6d40791327b10c06b551a080')

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
