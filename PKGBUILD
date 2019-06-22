# Maintainer: lod <aur@cyber-anlage.de>
pkgname=amdvlk
pkgver=2019.Q2.5
pkgrel=4
pkgdesc='AMDVLK - AMD Open Source Driver for Vulkan®'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=('MIT')
depends=('vulkan-icd-loader')
conflicts=('amdvlk-git' 'amdvlk-deb')
provides=('amdvlk' 'vulkan-driver')
source=(https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${pkgver}/amdvlk_${pkgver}_amd64.deb)
noextract=(amdvlk_${pkgver}_amd64.deb)
sha256sums=('3086094e1157a6ab6cf18a9b2364ff30643ee82f0daa7a856e285c6242d090cf')

build() {
  cd $srcdir
  ar -x ${srcdir}/amdvlk_${pkgver}_amd64.deb
  tar -xJf ${srcdir}/data.tar.xz
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
