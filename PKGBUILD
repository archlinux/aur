# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=u-msgpack-python
pkgname='python38-u-msgpack'
pkgver=2.7.1
pkgrel=5
arch=('any')
url="https://github.com/vsergeev/${_pkgname}"
license=('MIT')
pkgdesc="portable, lightweight MessagePack serializer and deserializer for Python"
depends=('python38')
makedepends=('python38')
checkdepends=('python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551')
b2sums=('10008f0653f969f1f5655c894be5b2497d692bf7ebf6d50de221695cab9c3a973c0870a8162efe6b61f2d9d4fb062c4130c07cddff8d64d6258d7d832efe4021')

build() {
    cd ${_pkgname}-${pkgver}

    python3.8 setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}

    pytest
}

package() {
    cd ${_pkgname}-${pkgver}
    python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
