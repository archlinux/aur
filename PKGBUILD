# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-headers
pkgver=1.2
pkgrel=1
pkgdesc='SPIR-V header files'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('custom')
source=("https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/${pkgver}/spirv.h"
        "https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/${pkgver}/spirv.hpp"
        "https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/${pkgver}/spirv.hpp11"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/SPIRV.html"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/images/SPIR_Nov14.svg"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/images/Khronos_Dec14.svg")
sha1sums=('dfc8e1b621941aca2ab085bc679d18324b34843b'
          'd16f0d4722a0f2e57003e8fee5327199520cb484'
          '74eea0810397e843a7dc17ccbcb9ca60ba2bdaa9'
          '5addcec1dc04709ae471bf12e7868929ecb129f0'
          '52590721a4be88dcd10000d4b723694f70ebb301'
          'c2608bbbb93ed17f122855d150bea9699181b8eb')

prepare() {
  cd "${srcdir}"

  # Extract license
  awk '1;/^$/{exit}' spirv.h | cut -c4- > LICENSE
}

package() {
  cd "${srcdir}"

  # Headers
  install -dm755            "${pkgdir}"/usr/include/spirv/
  install -m644 spirv.h     "${pkgdir}"/usr/include/spirv/
  install -m644 spirv.hpp   "${pkgdir}"/usr/include/spirv/
  install -m644 spirv.hpp11 "${pkgdir}"/usr/include/spirv/

  # Specification
  install -dm755           "${pkgdir}"/usr/share/doc/spir-v/
  install -m644 SPIRV.html "${pkgdir}"/usr/share/doc/spir-v/
  install -dm755           "${pkgdir}"/usr/share/doc/spir-v/images/
  install -m644 *.svg      "${pkgdir}"/usr/share/doc/spir-v/images/

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
