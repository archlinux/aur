# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2023
pkgrel=1
pkgdesc='Use this module to apply a number of blending modes to a background and foreground image'
arch=('any')
url='https://github.com/FHPythonUtils/BlendModes'
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
sha512sums=('1fd33ae28a314a5d5d0b6219c10f2185a8aaae5570a691dcb6bcffd5c1ae17819decb115b45acc84a20f9efd79d915ae0fdd4b49b87619a58828bd0ff37728ea')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
