# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2022
pkgrel=1
pkgdesc="Use this module to apply a number of blending modes to a background and foreground image"
arch=('any')
url="https://github.com/FHPythonUtils/BlendModes"
license=('MIT')
depends=('python-pillow'
         'python-numpy'
         'python-aenum'
         'python-deprecation')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4a51005085bc565880a3df8c33108f95cc57208c582ab314b82bafc3501e01af95bafcde8efb96bb90a86d94f5d5b46e2f7a988fbde632d15cccce624dcee7be')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
