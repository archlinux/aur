# Maintainer:
# Contributor: Daniel Scheiermann  <daniel.scheiermann@stud.uni-hannover.de>

## useful links:
# https://pypi.org/project/supersolids
# https://github.com/Scheiermann/supersolids

_module="supersolids"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.1.33
pkgrel=2
pkgdesc="Simulate and animate supersolids by solving the Schrödinger equation"
url="https://pypi.org/project/supersolids"
license=("MIT")
arch=(any)

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_pkgsrc.$_pkgext")
sha256sums=('01d7068678a577fcf6b8b4a5785a00333128ad22d9e4596c3dd3c1eba7103e7e')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  depends+=(
    'python-dill'
    'python-matplotlib'
    'python-numpy'
    'python-psutil'
    'python-ffmpeg-python'
    'python-scipy'
    'vtk'

    # AUR
    'python-mayavi'
      # python-envisage
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
