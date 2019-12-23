# Maintainer: lod <aur@cyber-anlage.de>

pkgname=amdvlk-bin
pkgver=2019.Q4.5
pkgrel=1
pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters (Stable DEB Release)'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=('MIT')
depends=('vulkan-icd-loader')
conflicts=('amdvlk' 'amdvlk-deb' 'amdvlk-git')
provides=('amdvlk' 'vulkan-driver')
source=(https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${pkgver}/amdvlk_${pkgver}_amd64.deb)
sha256sums=('05747ad84df60cbf5b3c974edeb3d45b124b89ec4d32e80dcc45d442bfa35603')

build() {
  ar -x ${srcdir}/amdvlk_${pkgver}_amd64.deb
  tar -xJf ${srcdir}/data.tar.xz
}

package() {
  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}/

  install usr/lib/x86_64-linux-gnu/amdvlk64.so ${pkgdir}/usr/lib/
  install usr/lib/x86_64-linux-gnu/spvgen.so ${pkgdir}/usr/lib/
  install etc/vulkan/icd.d/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install usr/share/doc/amdvlk/copyright ${pkgdir}/usr/share/licenses/${pkgname}/

  sed -i "s/\/x86_64-linux-gnu\//\//g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
}
