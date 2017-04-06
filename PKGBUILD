# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=oletools
pkgname=python2-oletools
pkgver=0.46
pkgrel=1
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
depends=('python2')
arch=('any')
url="https://bitbucket.org/decalage/oletools"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://bitbucket.org/decalage/oletools/downloads/${_pyname}-${pkgver}.tar.gz")
sha512sums=('6995948b0b67f7d8bd41c0f0fba0f84dd92349c2b348ab7efcf1d8ad99827ea7d6d5f9bc5911f1b0dfccf8815a2ca58f9b8e875c9f9dfcb79d314725a5df2a45')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

  # fixing shebang line
  cd "${pkgdir}/usr/lib/python2.7/site-packages/oletools/"
  for file in *.py; do
    if [ "${file}" != "__init__.py" ]; then
      sed -i '1s/python/python2/' "${file}"
    fi
  done
}

# vim:set et sw=2 ts=2 tw=79:
