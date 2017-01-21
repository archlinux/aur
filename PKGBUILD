# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-headers
pkgver=1.1
pkgrel=1
pkgdesc='SPIR-V header files'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('custom')
source=("https://www.khronos.org/registry/spir-v/api/${pkgver}/spirv.h"
        "https://www.khronos.org/registry/spir-v/api/${pkgver}/spirv.hpp"
        "https://www.khronos.org/registry/spir-v/api/${pkgver}/spirv.hpp11"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/SPIRV.html"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/images/SPIR_Nov14.svg"
        "https://www.khronos.org/registry/spir-v/specs/${pkgver}/images/Khronos_Dec14.svg")
sha1sums=('4875d0353eaf84248bc007907a902a6b3e30c640'
          '2658455ea8cea424b4594ce62471173eaf5c7c3a'
          '4b3564fa145cf90d29374cbecee1a5c5cec74db1'
          '28a6b0ab20fc6efd508c29f3d409cc6753cd7000'
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
