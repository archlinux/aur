# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-aigpy' 'python2-aigpy')
_pkgname=aigpy
pkgver=2020.2.14.0
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://pypi.org/project/aigpy"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)
source=("https://files.pythonhosted.org/packages/7c/81/13cc277b28d4bd6360828052e67b86dc7d415a8454fdb79f016b87f6e4a7/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE")
sha256sums=('785262f400dd7e7cfb27da791a84428381f675d52f800877471e9c6d1ea78c6c'
            '83e4dd21429a91fb7cea67a476032a9641425e5355df2e0f589a738b6ec9fd2c')

prepare() {
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}-2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py build
}

package_python-aigpy() {
  depends=(
    'python'
    'python-requests'
    'python-libconfigparser'
    'python-colorama'
    'python-mutagen'
  )
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-aigpy() {
  depends=(
    'python2'
    'python2-requests'
    'python2-libconfigparser'
    'python2-colorama'
    'python2-mutagen'
    'python2-futures'
  )
  cd "${srcdir}/${_pkgname}-${pkgver}-2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
