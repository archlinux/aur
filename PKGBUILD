# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=sfzlint
pkgver=0.1.3
pkgrel=1
pkgdesc="A linter and parser for SFZ files"
arch=(any)
url='https://github.com/jisaacstone/sfzlint'
license=(GPL)
depends=(python-appdirs python-lark-parser python-yaml)
makedepends=(python-setuptools)
options=(!emptydirs)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/jisaacstone/sfzlint/archive/refs/tags/v${pkgver}.tar.gz"
    'sfzlint-pickle-cache-dir.patch'
)
sha256sums=('f3af7ecbb3127a76c7631e96fc0c57e118411745a2bab77d48aa904523696499'
            'e68118d613784149d63f2a8c0bc64fb3e40972698df4b73a113d8ab837e685e2')


prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    patch -p1 -N -r '' -i "$srcdir"/sfzlint-pickle-cache-dir.patch
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --skip-build --root="${pkgdir}"/ --optimize=1
}
