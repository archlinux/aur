# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-headers
pkgver=1.3
pkgrel=1
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
sha1sums=('a3e49dd13ef5809ce628cbab86bff2823dc42e3d'
          'b6e21387f4cb7a9b9cf0411b4ba5ad81e0e17601'
          '76485af78b524289902f50a668bab1383f0c02e9'
          'a0a0b71a4a36128ecd3e02faefcd3151f76542a3'
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
