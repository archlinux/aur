# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=flatdict
pkgname=python-flatdict
pkgver=4.0.1
pkgrel=3
pkgdesc="Interact with nested dicts as a single level dict with delimited keys."
arch=('any')
url="https://flatdict.readthedocs.io"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gmr/flatdict/archive/${pkgver}.tar.gz")
sha256sums=('ab6ff85c6802fab90692727f055cd2183856789d96a53e75609439b778f5da06')
b2sums=('102ebc6220d75219b91ed7494485fa7d1447801d8276fd5e305f838f6b339b72c44151c751a53c32a5ea5b1d4876d9312af229bb8972401a2f86d6488d3f8b4f')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    nosetests
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
