# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=cp313
pkgname="python-${_name}"
pkgver=12.0.1
pkgrel=1
pkgdesc="Python interface to Gurobi"
arch=('aarch64' 'x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
depends=('glibc' "gurobi>=${pkgver%%.*}" 'python>=3.13' 'python-numpy' 'python-scipy')
makedepends=('python-installer' 'python-wheel')
source_aarch64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
source_x86_64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
noextract=("${source_x86_64[@]##*/}"
           "${source_aarch64[@]##*/}")
sha256sums_aarch64=('c971e40ddce1751e077e160593ed38d76a73d298365fd3f90737c1543104424d')
sha256sums_x86_64=('6e007cedc2c69f5a17918d0fe34e88e95f1670b5c24ac828a0df2b1716343459')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_${CARCH}.manylinux_2_17_${CARCH}.whl"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
