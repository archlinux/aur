# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=port-for
_github_url=https://github.com/kmike/port-for
pkgname=python-${_py_pkgname}
pkgver=0.4
pkgrel=3
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="${_github_url}"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-tox')
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    tox -e py3
}

package_python-port-for() {
    cd "${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
