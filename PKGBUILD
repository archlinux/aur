# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=sphinx-argparse
_github_url=https://github.com/ribozz/sphinx-argparse
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=0.1.15
pkgrel=2
pkgdesc="Sphinx extension that automatically documents argparse commands and options."
arch=('any')
url="${_github_url}"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

prepare() {
    cp -a "${srcdir}/${_py_pkgname}" "${srcdir}/python2-${_py_pkgname}"
}

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py build
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=('python-sphinx')

    cd "\${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=('python2-sphinx')

    cd "\${srcdir}/python2-${_py_pkgname}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}
EOF

# vim:set ts=4 sw=4 et:
