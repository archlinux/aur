# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2018.8.8
pkgrel=1
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/erocarrera/pefile/archive/v${pkgver}.tar.gz")
sha512sums=('b8c0aab1d197533e48d70d81066b0dc6ec0171cec8153debaf54ed1a8f07ea9fed749ee4b2f5b460d12a92c34e74d16c6da99d9305255eaeb503e74a148724e5')

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
