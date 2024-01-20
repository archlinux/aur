# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2024.0.1
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
sha512sums=('c7c929ab5302ea94e8ebf0e27690653269e515d09a60a49329b5f615ef2b5c169235f0ce30a6057adfe40ea0843b349b28baee8c19fa7421ebef4790599392e8')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
