# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_py="python2"
_pkg="u-msgpack"
pkgname="${_py}-${_pkg}"
_name="${pkgname#python2-}-python"
pkgver=2.8.0
pkgrel=3
pkgdesc='A MessagePack serializer and deserializer for Python2'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=("${_py}")
makedepends=("${_py}-setuptools")
checkdepends=("${_py}-pytest")
_tarname="${_name}-${pkgver}"
_repo_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_repo_url}/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=(
  'b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a'
)

build() {
    cd "${_tarname}"
    "${_py}" setup.py build
}

check() {
    cd "${_tarname}"
    LC_ALL='C.UTF-8' pytest2 --verbose
}

package() {
    cd "${_tarname}"
    "${_py}" setup.py install --root="${pkgdir}" \
                              --optimize=1 \
                              --skip-build
    install -Dm 644 'LICENSE' \
            -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
