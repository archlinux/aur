# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
pkgver=2025
pkgrel=1
pkgdesc='Use this module to apply a number of blending modes to a background and foreground image'
arch=('any')
url='https://github.com/FHPythonUtils/BlendModes'
license=('MIT')
depends=('python'
         'python-pillow'
         'python-numpy'
         'python-aenum')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-hatchling'
             'python-wheel')
checkdepends=('python-pytest'
              'python-imgcompare')
_tag='74eeb6a4cd887decca66ed23bcf448a964442463'
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
  cd "${pkgname}"
  pytest
}
