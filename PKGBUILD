# Maintainer: banana-bred <j.forer@posteo.net>

pkgname="ukrmol-out"
pkgver=3.2
pkgrel=3
epoch=
pkgdesc="Outer region programs for UKRmol+"
arch=('any')
url='https://zenodo.org/records/5799134'
license=('custom')
groups=()
depends=('lapack' 'blas' 'gbtolib')
makedepends=('cmake' 'gcc' 'gcc-fortran' 'cmake' 'doxygen' 'openmpi')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=('https://zenodo.org/record/5799134/files/ukrmol-out-'"${pkgver}"'.tar.gz?download=1')
sha256sums=('9d3acc132c4128957d0a34ac8700924d3efdb7b84e37107fad6f80ac840aee59')

build() {

  local _cmakeOptions=(
    -D CMAKE_C_COMPILER="$(command -v gcc)"
    -D CMAKE_CXX_COMPILER="$(command -v gcc)"
    -D CMAKE_Fortran_COMPILER="$(command -v mpifort)"
    -D CMAKE_Fortran_FLAGS='-fdefault-integer-8'
    -D GBTOLIB_INCLUDE_DIRS="/usr/mod/gbtolib"
    -D GBTOLIB_LIBRARIES="$(whereis libGBTO.a | cut -d " " -f2)"
  )

  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake "${_cmakeOptions[@]}" $(pwd)

  make

}

package() {

  install -d "${pkgdir}"/usr/bin/
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}"/bin/* "${pkgdir}"/usr/bin/

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/lib/*.a "${pkgdir}/usr/lib/${pkgname}/."

  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}"/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :
