# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver="1.5.1"
pkgrel="1"
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages."
arch=("any")
url="http://cclib.github.io"
license=("LGPL")
source=("https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('b22d8f0830cc1407010bb5bb50a185960984e1772986bc46ed710ba5e3690a31')

package_python-cclib() {
  depends=("python" "python-numpy")
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  find "${pkgdir}" -name "*.pyc" -delete
  find "${pkgdir}" -type d -empty -delete
}

package_python2-cclib() {
  depends=("python2" "python2-numpy")
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  find "${pkgdir}" -name "*.pyc" -delete
  find "${pkgdir}" -type d -empty -delete
  # Keep /usr/bin driver scripts, but not the default name.
  cd "${pkgdir}/usr/bin"
  for i in $(ls); do
    mv "${i}" "${i}2"
  done
}
