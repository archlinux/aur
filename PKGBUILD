# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-aigpy' 'python2-aigpy')
_pkgname=aigpy
pkgver=2019.9.20.2
pkgrel=2
pkgdesc="Python Common Lib"
arch=('any')
url="https://pypi.org/project/aigpy"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)
source=("https://files.pythonhosted.org/packages/06/8d/46ca89b991b15bfc28c9f44ca620be6fc3fe50c627a0f4316385e1b81474/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE")
sha256sums=('ad7f4e1a8fad7ca7f0efdcc79d7ed256b38521d9a07ca4c784e4143909036857'
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
