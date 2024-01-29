# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2024.1
pkgrel=1
pkgdesc='Use this module to apply a number of blending modes to a background and foreground image'
arch=('any')
url='https://github.com/FHPythonUtils/BlendModes'
license=('MIT')
depends=('python'
         'python-pillow'
         'python-numpy'
         'python-aenum')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('dbdf5708d440591e1927b3e70c9c09e6d633f4194f2650a56b8b245708b311f967a063b7ce0ee9c98d9a6fe46418bd4294cecd77ebdebc3c99154d34e583ce7a')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
