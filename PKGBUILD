# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=cp312
pkgname="python-${_name}"
pkgver=12.0.0
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
sha256sums_x86_64=('90bba495efb25cff5a3826158aff7be29637d2e80accc3a89a98cb8630856106')
sha256sums_aarch64=('f8287de7535c3b9c97f4aa8716969d70302a972bd09e9d3b6fbd7266ca0eab72')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-${_py}-${_py}-manylinux2014_${CARCH}.manylinux_2_17_${CARCH}.whl"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
