# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor : Kyle Keen <keenerd@gmail.com>

_py="python2"
_pkg="traitlets"
pkgname="${_py}-${_pkg}"
pkgver=4.3.3
pkgrel=6
pkgdesc="A configuration system for Python applications."
arch=('any')
url="https://${_pkg}.readthedocs.io/en/stable/"
license=('BSD')
depends=(
  "${_py}-decorator"
  "${_py}-enum34"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=("${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
        "${_pypi_url}/i/ipython_genutils/ipython_genutils-0.2.0.tar.gz")
md5sums=('3a4f263af65d3d79f1c279f0247077ef'
         '5a4f9781f78466da0ea1a648f3e1f79f')

# ipython_genutils does not deserve a package
# "Pretend this doesn’t exist. Nobody should use it."
# "Vestigial IPython utilities: DO NOT USE"
# (still required for now though, but drop at first chance)

build() {
  cd "${srcdir}"
}

package() {
  # TEMPORARY!
  cd "${srcdir}/ipython_genutils-0.2.0"
  "${_py}" setup.py install --prefix=/usr \
                            --root="$pkgdir" \
                            --optimize=0

  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=0
  install -Dm644 COPYING.md \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
