# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=dry
pkgname=${_pkgname}-git
pkgver=172.b58223e
pkgrel=2
pkgdesc='Dry – a bare bones fork of Urho3D – is a FOSS cross-platform 2D and 3D game engine implemented in C++'
arch=('any')
url="https://gitlab.com/luckeyproductions/${_pkgname}"
license=('MIT')
depends=('xorg-server')
provides=("${_pkgname}")
makedepends=('git' 'gcc' 'make' 'cmake')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./script/cmake_generic.sh ./ -D VIDEO_WAYLAND=OFF -D DRY_SAMPLES=0
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/opt/dry
  cp -R "${srcdir}/${pkgname}/." ${pkgdir}/opt/dry/

  rm -r ${pkgdir}/opt/dry/Docs ${pkgdir}/opt/dry/script \
    ${pkgdir}/opt/dry/CMake ${pkgdir}/opt/dry/Source/CMake* \
    ${pkgdir}/opt/dry/Source/Clang-Tools ${pkgdir}/opt/dry/Source/Samples \
    ${pkgdir}/opt/dry/quick.sh ${pkgdir}/opt/dry/settings.gradle.kts \
    ${pkgdir}/opt/dry/CMakeCache.txt ${pkgdir}/opt/dry/.git* \

  find ${pkgdir}/opt/dry/Source/Dry -name "Precompiled.h.*" -type f -delete
  find ${pkgdir}/opt/dry -name "*.make" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cmake" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cpp.o.d" -type f -delete
  find ${pkgdir}/opt/dry -name "*.internal" -type f -delete
  find ${pkgdir}/opt/dry -name "*.c.o.d" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cpp.o" -type f -delete
  find ${pkgdir}/opt/dry -name "*.c.o" -type f -delete
  find ${pkgdir}/opt/dry -name "*.c" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cpp" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cxx.o.d" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cc" -type f -delete
  find ${pkgdir}/opt/dry -name "Makefile" -type f -delete
  find ${pkgdir}/opt/dry -name "CMakeFiles" -type d -exec rm -r {} +
  find ${pkgdir}/opt/dry -name "CMakeLists.txt" -type f -delete
}
