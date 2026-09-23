# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ccx2paraview
pkgdesc="CalculiX to Paraview converter (frd to vtk/vtu)"
pkgver=3.2.1
pkgrel=1
arch=(x86_64)
url="https://github.com/calculix/${pkgname}"
license=(GPL-3.0-or-later)
depends=(python-numpy vtk ffmpeg python-mpi4py fmt pdal glew ospray qt5-base openvr
  unixodbc liblas cgns adios2 libharu gl2ps postgresql-libs netcdf mariadb-libs)
makedepends=(python-build python-installer python-setuptools-git-versioning)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('46e16497ccb0bb22a22134d8422634f88d41ff5763ce8679a0008de5d50157d2a58f0b34e9a9fcc854b8f08280ad982f35117042fc127aed55639c9415eeb2df')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
