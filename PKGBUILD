# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ccx2paraview
pkgdesc="CalculiX to Paraview converter (frd to vtk/vtu)"
pkgver=3.2.0
pkgrel=2
arch=(x86_64)
url="https://github.com/calculix/${pkgname}"
license=(GPL-3.0-or-later)
depends=(python-numpy vtk ffmpeg python-mpi4py fmt pdal glew ospray qt5-base openvr
  unixodbc liblas cgns adios2 libharu gl2ps postgresql-libs netcdf mariadb-libs)
makedepends=(python-build python-installer python-setuptools-git-versioning)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0b5d476c514dccf5f61603eb3a6d474470646b539201d33635c04d5a10c66294285edb456649a959461229e7b537ea4521f2189119141e5c321dae584f4ce982')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
