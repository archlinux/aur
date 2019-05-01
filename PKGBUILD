# Maintainer: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>

_proj=fluiddyn
_name=fluiddyn
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=2
pkgdesc="FluidDyn project | Framework for studying fluid dynamics."
arch=('any')
url="https://${_name}.readthedocs.io"
license=('custom:"CeCILL-B"')
depends=(
  'python' 'python-numpy' 'python-matplotlib' 'python-h5py' 'python-psutil'
  'python-cached-property' 'python-h5netcdf'
)
optdepends=(
  'python-pyfftw: Calculate FFT'
  'python-pillow: Image I/O'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=(python-${_name})
conflicts=(python2-${_name}-hg)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('488dcc8cd1660fd6eed939defeb21250114b5de9c94cc1d979136ea439789b33')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
