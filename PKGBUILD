# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Maxime Arthaud <maxime@arthaud.me>

pkgbase=python-formatstring
pkgname=('python-formatstring' 'python2-formatstring')
_pyname=${pkgbase/python-}
pkgver=1.1
pkgrel=1
pkgdesc='Library to help the exploitation of format string vulnerabilities'
url="https://github.com/arthaud/formatstring"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/arthaud/formatstring/archive/v${pkgver}.tar.gz)
sha512sums=('8c004dafb483085d3f0a71f4bb979b1c51c0762dcc9f4911674df7b46d8d767e7a5a6a77c74e54802c3e010eed21ebc4232695de6a9d144223e801cee1e1f80e')

prepare() {
  cp -a ${_pyname}-${pkgver}{,-py2}

  cd ${_pyname}-${pkgver}-py2
  sed -r 's|(/usr/bin/env python)3|\12|g' -i formatstring/*.py
  sed -r 's|(fmtstr_pattern_create)|\1-py2|g' -i setup.py
  sed -r 's|(fmtstr_pattern_offset)|\1-py2|g' -i setup.py
}

package_python-formatstring() {
  depends=('python')
  optdepends=('python-pyelftools: infer the architecture from a binary file')

  cd ${_pyname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python2-formatstring() {
  depends=('python2')
  optdepends=('python2-pyelftools: infer the architecture from a binary file')

  cd ${_pyname}-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
