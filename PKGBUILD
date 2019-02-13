# Maintainer: Jack Random < jack(at)random(dot)to >
# previous maintainer: Carl George < arch at cgtx dot us >

_name="hiredis"

pkgname=("python-${_name}" "python2-${_name}")
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Python wrapper for hiredis"
arch=("i686" "x86_64")
url="https://github.com/redis/hiredis-py"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/9e/e0/c160dbdff032ffe68e4b3c576cba3db22d8ceffc9513ae63368296d1bcc8/${_name}-${pkgver}.tar.gz")
sha256sums=('e97c953f08729900a5e740f1760305434d62db9f281ac351108d6c4b5bf51795')

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
