# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
pkgname="python-${_name}"
pkgver=1.7.1
_commit="bdd3757964b8b6d03615a0d7ca045886dbe962e8"
pkgrel=1
pkgdesc="Python interface for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('bertini_real' 'python' 'python-algopy' 'python-dill' 'python-glumpy'
         'python-matplotlib' 'python-numpy' 'python-scipy' 'python-setuptools'
         'python-sympy' 'python-trimesh') # 'python-glfw' 'python-triangle' 'python-opengl'
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('3836db7d354fb979e9214a6ab131ed5cc6940d198c27bacb27ac7b654aba9fa0')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/python/${_name}"
  sed -n "s/^__version_info__ = (\(.*\))/\1/p" "__about__.py" | sed "s/, /./g"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgsrc}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
