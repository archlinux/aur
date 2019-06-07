# Maintainer: lod <aur@cyber-anlage.de>
pkgname=amdvlk
pkgver=2019.Q2.4
pkgrel=1
pkgdesc='AMDVLK - AMD Open Source Driver for Vulkan®'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=('MIT')
depends=('vulkan-icd-loader')
conflicts=('amdvlk-git' 'amdvlk-deb' 'vulkan-amdgpu-pro' 'amdgpu-pro-vulkan')
provides=('amdvlk' 'vulkan-driver')
source=(https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${pkgver}/amdvlk_${pkgver}_amd64.deb)
sha256sums=('050121b1ba01054aeca36cde01dc81ff3b35159dc158d1830424f32f8219477d')

build() {
  cd $srcdir
  ar -x ${startdir}/src/amdvlk_${pkgver}_amd64.deb
  tar -xJf ${startdir}/src/data.tar.xz
}

package() {
  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
  install -m755 -d ${pkgdir}/usr/share/licenses/amdvlk

  install usr/lib/x86_64-linux-gnu/amdvlk64.so ${pkgdir}/usr/lib/
  install etc/vulkan/icd.d/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install usr/share/doc/amdvlk/copyright ${pkgdir}/usr/share/licenses/amdvlk/

  sed -i "s/\/x86_64-linux-gnu\//\//g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
}
