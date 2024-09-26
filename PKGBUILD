# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=cp312
pkgname="python-${_name}"
pkgver=11.0.3
pkgrel=1
pkgdesc="Python interface to Gurobi"
arch=('x86_64' 'aarch64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
makedepends=('python-installer' 'python-wheel')
depends=('glibc' 'gurobi' 'python>=3.8' 'python-numpy' 'python-scipy')
noextract=("${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_"{x86_64.manylinux_2_17_x86_64,aarch64.manylinux_2_17_aarch64}".whl")
source_x86_64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
sha256sums_x86_64=('d08a69a9884b2c7ab843c9967b44770c17c73ac5726db7a8794ae85d7c1fc446')
sha256sums_aarch64=('b752a8a4d898a3cc59b0670aa449dee8e2159d4f420f30033baf96f14a36516d')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_${CARCH}.manylinux_2_17_${CARCH}.whl"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
