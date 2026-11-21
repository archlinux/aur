# Maintainer: Carlo Casta <carlo.casta at gmail dot com>

pkgname=spirv-reflect
_pkgname=SPIRV-Reflect
pkgver=1.4.363.0
pkgrel=1
pkgdesc="lightweight library that provides a C/C++ reflection API for SPIR-V shader bytecode in Vulkan applications"
arch=('x86_64')
url="https://github.com/KhronosGroup/${_pkgname}"
license=('Apache 2.0')
source=(https://github.com/KhronosGroup/${_pkgname}/archive/refs/tags/vulkan-sdk-${pkgver}.tar.gz)
sha256sums=('e0b2914648ab2eac1c83851911199e73f868d966e183531e4c227a258ea07bc6')

_pkgdirname=${_pkgname}-vulkan-sdk-${pkgver}

build()
{
  cmake -S ${_pkgdirname}             \
        -B build                      \
        -DCMAKE_INSTALL_PREFIX=/usr   \
        -DSPIRV_REFLECT_STATIC_LIB=ON \
        -DSPIRV_REFLECT_SHARED_LIB=ON

  cmake --build build 
}

package()
{
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${_pkgdirname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

