# Maintainer: Vi0L0 <vi0l093@gmail.com>
# GREAT Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: npfeiler (2.2 update)
# Contributor: Solant
# Contributor: sigbjorn

pkgname=amdapp-codexl
pkgver=2.3.605
pkgrel=1
pkgdesc="AMD CodeXL is an OpenCL, Vulkan and OpenGL Debugger and Profiler, with static OpenCL kernel analyzer. It supports OpenCL 2.0"
arch=('x86_64')
url="http://gpuopen.com/compute-product/codexl/"
license=('MIT')
options=('staticlibs' 'libtool' '!upx')
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
md5sums=('7bb380fc9bad953894bb534ece9aa6d3'
         'aa9e53ea4c6fca125fbedaf6d968a76a'
         '34792207ff65c7b2314a9bd8cbeb4e1f'
         'a80e16b7378abdd3e0d6d34e485246e1')

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
