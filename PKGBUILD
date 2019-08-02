# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgbase=python-pefile
pkgname=('python-pefile' 'python2-pefile')
pkgver=2019.4.18
pkgrel=1
pkgdesc="Python PE parsing module"
arch=('any')
url="https://github.com/erocarrera/pefile"
license=('MIT')
makedepends=('python' 'python2' 'python-future' 'python2-future')
source=(https://github.com/erocarrera/pefile/releases/download/v${pkgver}/pefile-$pkgver.tar.gz)
sha512sums=('33c53120fd6a0fde22f4076c19ed8f69fc2b53b16d0c581133446d0d770e290dcb2ddd1e9941e8d8debc28c1cb4ff64ff055c2b8c0958015d9121de72ae20c76')

prepare() {
  cd "${srcdir}"
  cp -r pefile-"${pkgver}" pefile2-"${pkgver}"
}

# currently disabled because of missing files in the tarball
# check() {
#   cd "${srcdir}/pefile-${pkgver}"
#   LC_CTYPE=en_US.UTF-8 python setup.py test
#
#   cd "${srcdir}/pefile2-${pkgver}"
#   LC_CTYPE=en_US.UTF-8 python2 setup.py test
# }

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
