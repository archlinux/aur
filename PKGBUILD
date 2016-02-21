# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-headers
pkgver=1.0
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
sha1sums=('ca2eb5fb825fc4655746bd476fe7a9f095e03037'
          '3a6dae5aca1cc25ca5498cd98a9a0b54d577e4df'
          '645965fb74c4ef85c2046963624453497952029d'
          '6b0ba3017b06301fc7b03fb589d9fed8e1641b26'
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
