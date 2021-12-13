# Maintainer: Henry-Joseph Audéoud <h.audeoud at gmail dot com>

pkgname=python-ebtables
pkgver=0.2.0
pkgrel=3
pkgdesc='A simple Python binding for Ebtables'
arch=('x86_64')
url='https://github.com/ldx/python-ebtables'
license=('GPL2')
depends=('python' 'python-cffi>=0.5.0' 'ebtables')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ldx/${pkgname}/archive/v${pkgver}.tar.gz"
        commit_f7956b4_partial.patch
        fix_library_path_for_arch_linux.patch)
sha256sums=('5d5cc3b84dd7ce3bd3299fa276e71bc2dece4b2cb8a388828b54bd92a5c549b3'
            '4eaf163ce7fad84ec7ab369c96126dfe274834cdb99d73edf437be21bb78e701'
            '9e652ed354283c76b7bf310df07287f67eb0d65ef397e7a03919489a88821b06')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/${source[1]}"
    patch -p1 < "${srcdir}/${source[2]}"
}

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py check
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
