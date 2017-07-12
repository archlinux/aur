# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=oletools
pkgname=python2-oletools
pkgver=0.51
pkgrel=1
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
depends=('python2')
arch=('any')
url="https://github.com/decalage2/oletools"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/decalage2/oletools/archive/v${pkgver}.tar.gz")
sha512sums=('030da6195af1554ca8725eb41f7c0974aa26028340d296d165f7797179bc6b076e31a5cc061addc6b357115ed62976bcf7fe9369c67d7b6629baa17ff12f535d')

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
