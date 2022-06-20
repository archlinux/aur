# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname='python2-u-msgpack'
_name="${pkgname#python2-}-python"
pkgver=2.7.1
pkgrel=2
pkgdesc='A MessagePack serializer and deserializer for Python2'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551')

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    cd "${_tarname}"
    pytest2
}

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
