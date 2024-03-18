# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-blendmodes
_name=${pkgname#python-}
pkgver=2024.1.1
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
sha512sums=('81d3d904d0164a0798f481d372deb48e651bfa95b623f7f3fe9df814b435b63e1e1e23c91feff6e4ca9957576f351d8a37a10ff1732b9c33e1566bb5ab631487')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
