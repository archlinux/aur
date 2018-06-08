# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=pytoml
pkgbase=python-pytoml
pkgname=('python-pytoml' 'python2-pytoml')
pkgver=0.1.16
pkgrel=1
pkgdesc="A TOML-0.4.0 parser/writer for Python."
arch=('any')
url="https://github.com/avakar/${_pkgname}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('15828a91627e750ef5440d1aa9fd9a920793760bd151dc45d3de22ab1c668e17')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
    python2 -m pytest
}

package_python-pytoml() {
    depends=('python')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-pytoml() {
    depends=('python2')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
