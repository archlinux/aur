# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
# Contributor: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_py_pkgname=nss
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=1.0.1
pkgrel=1
pkgdesc="Python bindings for NSS and NSPR"
arch=(i686 x86_64)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Python_binding_for_NSS"
license=(MPL GPL LGPL)
depends=(nss)
makedepends=(python-setuptools python2-setuptools)
source=("https://ftp.mozilla.org/pub/security/python-nss/releases/PYNSS_RELEASE_${pkgver//./_}/src/python-nss-${pkgver}.tar.bz2")
sha512sums=('88fc5a066a54524f0dd73cba8947bb3cd4cc078cf59a72253f0e56d835f39679a10a4ee87b5d9f4c167d0ff7a40704dee2e4d890e1d304afbe346ba02b8750b9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends+=('python')

    cd "\${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1
}

package_python2-${_py_pkgname}() {
    depends+=('python2')

    cd "\${srcdir}/${pkgname}-${pkgver}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1
}
EOF

# vim:set ts=4 sw=4 et:
