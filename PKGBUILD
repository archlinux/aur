# Maintainer: lod <aur@cyber-anlage.de>
pkgname=amdvlk-bin
pkgver=2019.Q2.5
pkgrel=2
pkgdesc='AMDVLK (Stable DEB Release) - AMD Open Source Driver for Vulkan®'
arch=('x86_64')
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=('MIT')
depends=('vulkan-icd-loader')
conflicts=('amdvlk' 'amdvlk-deb' 'amdvlk-git')
provides=('amdvlk' 'vulkan-driver')
source=(amdPalSettings.cfg
        https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${pkgver}/amdvlk_${pkgver}_amd64.deb)
sha256sums=('81dd70606621713217de5a4cc2aabf6b9e34d4324b5eaaf0429e4f88c9b60b42'
            '3086094e1157a6ab6cf18a9b2364ff30643ee82f0daa7a856e285c6242d090cf')

build() {
  cd $srcdir
  ar -x ${srcdir}/amdvlk_${pkgver}_amd64.deb
  tar -xJf ${srcdir}/data.tar.xz
}

package() {
  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
  install -m755 -d ${pkgdir}/usr/share/licenses/amdvlk
  install -m755 -d ${pkgdir}/etc/amd

  install usr/lib/x86_64-linux-gnu/amdvlk64.so ${pkgdir}/usr/lib/
  install etc/vulkan/icd.d/amd_icd64.json ${pkgdir}/usr/share/vulkan/icd.d/
  install usr/share/doc/amdvlk/copyright ${pkgdir}/usr/share/licenses/amdvlk/
  install amdPalSettings.cfg ${pkgdir}/etc/amd/

  sed -i "s/\/x86_64-linux-gnu\//\//g" ${pkgdir}/usr/share/vulkan/icd.d/amd_icd64.json
}
