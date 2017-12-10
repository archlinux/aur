# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=sphinx-argparse
_github_url=https://github.com/ribozz/sphinx-argparse
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=0.2.1
pkgrel=2
pkgdesc="Sphinx extension that automatically documents argparse commands and options."
arch=('any')
url="${_github_url}"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    
    py.test
    # Tests fail because of non-standard executable name py.test2
    # py.test2
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=('python-sphinx' 'python-commonmark')

    cd "\${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=('python2-sphinx' 'python2-commonmark')

    cd "\${srcdir}/${_py_pkgname}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}
EOF

# vim:set ts=4 sw=4 et:
