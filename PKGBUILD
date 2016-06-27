# Maintainer: Carl George < arch at cgtx dot us >

_name="hiredis"

pkgname=("python-${_name}" "python2-${_name}")
pkgver="0.2.0"
pkgrel="1"
pkgdesc="Python wrapper for hiredis"
arch=("i686" "x86_64")
url="https://github.com/redis/hiredis-py"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ca958e13128e49674aa4a96f02746f5de5973f39b57297b84d59fd44d314d5b5')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-hiredis() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D -p -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_python2-hiredis() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D -p -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
