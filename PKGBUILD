# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=unrardll
pkgbase='python-unrardll'
pkgname=('python-unrardll' 'python2-unrardll')
pkgver=0.1.3
pkgrel=1
pkgdesc="Python wrapper for the UnRAR DLL"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/${_pkgname}"
license=('BSD')
depends=('libunrar')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('5f214ab1ec24208c6ee353f2d836e536968d5379b7140129f04aa3a52bc56a5e'
            'SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py build
  python2 setup.py build
}

package_python-unrardll() {
  depends+=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python2-unrardll/LICENSE"
}

package_python2-unrardll() {
  depends+=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python2-unrardll/LICENSE"

}
