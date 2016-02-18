# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools
_ver=1.0-rev3
pkgver=${_ver//-/.}
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/spirv-${_ver}.tar.gz")
sha1sums=('e56838cd22d08adb6643dac7b98b5331bdbe41db')
makedepends=('cmake')
options=('staticlibs')

build() {
  cd "${srcdir}"/SPIRV-Tools-spirv-"${_ver}"
  cmake -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/SPIRV-Tools-spirv-"${_ver}"

  # Tools
  install -dm755                   "${pkgdir}"/usr/bin/
  install -m755 spirv-{as,dis,val} "${pkgdir}"/usr/bin/

  # Library
  install -dm755    "${pkgdir}"/usr/lib/
  install -m644 *.a "${pkgdir}"/usr/lib/

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
