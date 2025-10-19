#Maintainer: Pedro Gameiro <https://github.com/pedrogameiro>
#Contributor: archdevlab <https://github.com/archdevlab>

major=2025.Q2.1

pkgbase=amdvlk-bin
pkgdesc="AMD's standalone Vulkan driver"
pkgname=(amdvlk-bin lib32-amdvlk-bin)
pkgver=${major}
pkgrel=2
arch=(x86_64)
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=(MIT)
options=('!strip' '!debug')
source=(https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${major}/amdvlk-${major}.x86_64.rpm
        https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${major}/amdvlk_${major}_i386.deb)
sha256sums=('932c79062e2487bb1f318136bcf666cb0342faea29e70f791b8f6f425d6afdf8'
            '40985dbf2e62b158e85720c0469dd4c3f1e386b65b0a1c67b17491b2747e14d7')

package_amdvlk-bin(){
  pkgdesc="AMD's standalone Vulkan driver (Stable RPM Release)"
  arch=(x86_64)
  conflicts=(amdvlk)
  provides=(amdvlk vulkan-driver)

  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/doc/amdvlk/
  install -m755 -d "${pkgdir}"/usr/lib

  install usr/lib64/amdvlk64.so "${pkgdir}"/usr/lib/amdvlk64.so
  install etc/vulkan/icd.d/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
  install etc/vulkan/implicit_layer.d/amd_icd64.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd64.json
  install usr/share/doc/amdvlk/LICENSE.txt "${pkgdir}"/usr/share/doc/amdvlk/LICENSE.txt
}

package_lib32-amdvlk-bin(){
  pkgdesc="AMD's standalone Vulkan driver (32-bit) (Stable DEB Release)"
  arch=(i686 x86_64)
  depends=(amdvlk-bin=${major})
  conflicts=(lib32-amdvlk)
  provides=(lib32-amdvlk lib32-vulkan-driver)

  tar -xf data.tar.gz

  install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/lib32

  install usr/lib/i386-linux-gnu/amdvlk32.so "${pkgdir}"/usr/lib32/amdvlk32.so
  install etc/vulkan/icd.d/amd_icd32.json "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd32.json
  install etc/vulkan/implicit_layer.d/amd_icd32.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd32.json

  sed -i 's|/i386-linux-gnu||' "$pkgdir/"usr/share/vulkan/icd.d/amd_icd32.json
  sed -i 's|/lib|/lib32|' "$pkgdir/"usr/share/vulkan/icd.d/amd_icd32.json
  sed -i 's|/i386-linux-gnu||' "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json
  sed -i 's|/lib|/lib32|' "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json
}

# vim:set ts=8 sts=2 sw=2 et:
