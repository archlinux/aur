# Maintainer: Carl George < arch at cgtx dot us >

_name="asyncpg"
pkgname="python-${_name}"
pkgver="0.8.4"
pkgrel="1"
pkgdesc="An asyncio PosgtreSQL driver"
arch=("i686" "x86_64")
url="https://github.com/MagicStack/${_name}"
license=("Apache")
makedepends=("python-setuptools" "cython")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bd8bab16b3bff632726421f04088f0cc5b1421efcbcff02f3c352ac9365e65cb')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -e '/include_package_data=True,/d' -i setup.py
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
