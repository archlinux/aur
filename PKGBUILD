# Maintainer: Jan Sandberg <jan dot sandberg at gmx dot ch>

pkgname=python-poxls-git
conflicts=('python-poxls')
provides=('python-poxls')
_pkgname=poxls
pkgver=1.5.0.r0.g2dc5a94
pkgrel=1
pkgdesc='Convert between Excel and PO files'
url='https://pypi.python.org/pypi/poxls'
arch=('any')
license=('BSD')
_deps=('click' 'openpyxl' 'polib')
makedepends=('git' 'python-setuptools')
depends=("${_deps[@]/#/python-}")
source=("poxls::git+https://github.com/wichert/po-xls.git"
        "LICENSE")
sha256sums=('SKIP'
            'c909022c938835ff0a322a536315c193732bcd308bae4538fc81cc21896230e1')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's:^release/::;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package_python-poxls-git() {
    depends=('python' "${_deps[@]/#/python-}")
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
