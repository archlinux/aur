# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-aigpy' 'python2-aigpy')
_pkgname=aigpy
pkgver=2020.2.28.0
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://pypi.org/project/aigpy"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)
source=("https://files.pythonhosted.org/packages/c5/ff/36b3631cd90302e9df7af39e62d416fb4bfa5f03328258418de9abddf42a/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE")
sha256sums=('c471ef93a342410648dd8656d6024fba8bb7f0a3e600d790363e901abc1780c5'
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
