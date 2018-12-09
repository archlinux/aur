# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-headers
pkgver=1.3
pkgrel=3
pkgdesc='SPIR-V header files'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('custom')
source=("https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/unified1/spirv.h"
        "https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/unified1/spirv.hpp"
        "https://github.com/KhronosGroup/SPIRV-Headers/raw/master/include/spirv/unified1/spirv.hpp11"
        "https://www.khronos.org/registry/spir-v/specs/unified1/SPIRV.html"
        "https://www.khronos.org/registry/spir-v/specs/unified1/images/SPIR_Nov14.svg"
        "https://www.khronos.org/registry/spir-v/specs/unified1/images/Khronos_Dec14.svg")
sha1sums=('b24d1c325d84466900a78425af6764e7cea3a9dc'
          '9c2d8a146b7ac10bb551ad7536d9bf882aebceeb'
          '1017790a850ede5a390af179a325a496e4684d02'
          'fdf5f4e36ce2752d0408efae3edc4194937b0836'
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
