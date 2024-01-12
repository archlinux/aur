# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2024
pkgrel=1
pkgdesc='Use this module to apply a number of blending modes to a background and foreground image'
arch=('any')
url='https://github.com/FHPythonUtils/BlendModes'
license=('MIT')
depends=('python'
         'python-pillow'
         'python-numpy'
         'python-aenum'
         'python-deprecation')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('09f89378cec98398cdd428be7f4c06a5e54727949c72929e43ea1336b5c04bf402f498769bdc0e7e9a8b7093d00f2365b18176ef4e9727b216557d0c1441a27a')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
