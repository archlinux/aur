# Maintainer: Vi0L0 <vi0l093@gmail.com>
# GREAT Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: npfeiler (2.2 update)
# Contributor: Solant
# Contributor: sigbjorn

pkgname=amdapp-codexl
pkgver=2.6.302
pkgrel=1
pkgdesc="AMD CodeXL is an OpenCL, Vulkan and OpenGL Debugger and Profiler, with static OpenCL kernel analyzer. It supports OpenCL 2.0"
arch=('x86_64')
url="http://gpuopen.com/compute-product/codexl/"
license=('MIT')
options=('staticlibs' 'libtool')
groups=('amdapp')
depends=('glu'
  'gtk2'
  'qt5-multimedia'
  'qt5-webkit'
  'xorg-xhost')
optdepends=('libpng12: Vulkan debugging'
  'lib32-libx11: 32 bit debugging'
  'opencl-icd-loader: for OpenCL debugging'
  'vulkan-icd-loader: Vulkan debugging')
source=("https://github.com/GPUOpen-Tools/CodeXL/releases/download/v${pkgver:0:3}/CodeXL_Linux_x86_64_${pkgver}.tar.gz"
      CodeXL.sh
      codexl.png
      codexl.desktop)
sha256sums=('d8309a2668124b360faaf442418e077d09b2b64f8359bb31f2b26246c93dfe38'
         'cdb64abab735812edf07fadc356b4e923373f9edb994923371c19b452de6a89e'
         '2913cddb375c877ea3d27f2474d09e51dcdf0f0ede0436bf7db986e4b0ad170d'
         '28f67d68bc2382aa410439416f698952f7538dd7de176054fc49ff4fe5f7c838')

#Install path
_ipath='opt/AMDAPP/CodeXL'

package() {
  mkdir -p "${pkgdir}/${_ipath}"
  cd "${srcdir}/CodeXL_Linux_x86_64_$pkgver/"
  mv *  "${pkgdir}/${_ipath}"
  install -D -m644 "${pkgdir}/${_ipath}/Legal/CodeXLEndUserLicenseAgreement-Linux.htm" "$pkgdir/usr/share/licenses/$pkgname/EULA.htm"

  cd "${srcdir}"
  install -D -m755 "CodeXL.sh" "$pkgdir/usr/bin/CodeXL"
  install -D -m755 "codexl.png" "$pkgdir/usr/share/pixmaps/codexl.png"
  install -D -m755 "codexl.desktop" "$pkgdir/usr/share/applications/codexl.desktop"
  find "${pkgdir}/${_ipath}/RuntimeLibs/QT/" -name "*Qt*" | xargs rm # use system Qt libs
} 
