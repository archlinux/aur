# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: Kai Xuan <woxuankai at gmail dot com>

_pkgname='ants'
pkgname="${_pkgname}"
pkgver=2.4.0
pkgrel=1
pkgdesc='Advanced Normalization Tools (ANTs) computes high-dimensional \
mappings to capture the statistics of brain structure and function'
arch=('i686' 'x86_64')
url='http://www.picsl.upenn.edu/ANTS/'
license=('Apache')
depends=('r' 'vtk' 'perl' 'insight-toolkit>=5')
makedepends=('git' 'cmake')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/ANTsX/ANTs/archive/v${pkgver}.tar.gz")
md5sums=('35fef402ede48f80dae507c3e42fbdad')

prepare() {
  cd "${srcdir}/ANTs-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/ANTs-${pkgver}/build"
  cmake \
      -DBUILD_ALL_ANTS_APPS=ON \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_STYLE_UTILS=OFF \
      -DBUILD_TESTING=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/opt/ANTs \
      -DEXTERNAL_PROJECT_BUILD_TYPE=Release \
      -DFORCE_EXTERNAL_BUILDS=OFF \
      -DITK_BUILD_MINC_SUPPORT=OFF \
      -DITK_VERSION_MAJOR=5 \
      -DOLD_BASELINE_TESTS=OFF \
      -DRUN_LONG_TESTS=OFF \
      -DRUN_SHORT_TESTS=ON \
      -DSuperBuild_ANTS_USE_GIT_PROTOC=ON \
      -DUSE_SYSTEM_ITK=OFF \
      -DUSE_SYSTEM_SlicerExecutionMode=OFF \
      -DUSE_SYSTEM_VTK=OFF \
      -DUSE_VTK=ON \
      ..
  make
}

package() {
  cd "${srcdir}/ANTs-${pkgver}/build/ANTS-build"
  make DESTDIR="${pkgdir}" install
}

