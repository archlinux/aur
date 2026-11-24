# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=itk-lite
pkgver=5.4.8
pkgrel=1
pkgdesc="Cross-platform system that provides developers with an extensive suite of software tools for image analysis"
arch=(x86_64)
url="https://itk.org/"
license=(Apache-2.0)
depends=(
    expat
    gdcm
    glibc
    hdf5
    libgcc
    libjpeg-turbo
    libpng
    libstdc++
    libtiff
    zlib
    )
makedepends=(
    cmake
    eigen
    git
    gtest
    )
provides=(itk insight-toolkit)
conflicts=(itk insight-toolkit)
source=("https://github.com/InsightSoftwareConsortium/ITK/releases/download/v${pkgver}/InsightToolkit-${pkgver}.tar.gz"
        #"${pkgname}-${pkgver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${pkgver}.tar.gz"
        )
sha512sums=('87d40f5b393567ec11983b2d69213331cdf01d1699d9e43254cf10d71f353981b299acdd65060e5b34db651ff941b3a2d8e9d3f0e2e28dde85799084ceffe99d')

build() {
  local _flags=(
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DModule_ITKReview:BOOL=ON
    -DITK_USE_SYSTEM_JPEG:BOOL=ON
    -DITK_USE_SYSTEM_PNG:BOOL=ON
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON
    -DITK_USE_SYSTEM_TIFF:BOOL=ON
    -DITK_USE_SYSTEM_GDCM:BOOL=ON
    -DITK_LEGACY_SILENT:BOOL=ON
    -DCMAKE_CXX_FLAGS:STRING="-std=c++98"
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON
    -DITK_USE_SYSTEM_FFTW:BOOL=ON
    -DITK_USE_SYSTEM_HDF5:BOOL=ON
    -DITK_USE_SYSTEM_GOOGLETEST=OFF
    -DModule_ITKIOMINC:BOOL=ON
    -DModule_ITKIOTransformMINC:BOOL=ON
    -DModule_SimpleITKFilters:BOOL=ON
  )

  cmake -B build -S "InsightToolkit-${pkgver}" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
