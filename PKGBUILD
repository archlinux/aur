# Maintainer: Vi0L0 <vi0l093@gmail.com>
# GREAT Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

# PKGEXT='.pkg.tar.gz'  # imho time to pack this pkg into tar.xz is too long, unfortunatelly yaourt got problems when ext is different from .pkg.tar.xz - V

pkgname=amdapp-codexl
pkgver=2.1
pkgrel=228
# _pkgrel=228
pkgdesc="AMD CodeXL is an OpenCL, Vulkan and OpenGL Debugger and Profiler, with static OpenCL kernel analyzer. It supports OpenCL 2.0"
arch=('x86_64')
url="http://gpuopen.com/compute-product/codexl/"
license=('MIT')
options=('staticlibs' 'libtool' '!strip' '!upx')
groups=('amdapp')
depends=('libpng12' 'libgl' 'libcl' 'xorg-xhost')
source=("https://github.com/GPUOpen-Tools/CodeXL/releases/download/v${pkgver}/CodeXL_Linux_x86_64_${pkgver}.${pkgrel}.tar.gz"
      CodeXL.sh
      codexl.png
      codexl.desktop)
  md5sums=('1eddbd59062815776f24ad2f41fd4676'
      'aa9e53ea4c6fca125fbedaf6d968a76a'
      '34792207ff65c7b2314a9bd8cbeb4e1f'
      'a80e16b7378abdd3e0d6d34e485246e1')

#Install path
_ipath='opt/AMDAPP/CodeXL'

package() {
  mkdir -p "${pkgdir}/${_ipath}"
  cd "${srcdir}/CodeXL_Linux_x86_64_$pkgver.$pkgrel/"
  mv *  "${pkgdir}/${_ipath}"
  install -D -m644 "${pkgdir}/${_ipath}/Legal/CodeXLEndUserLicenseAgreement-Linux.htm" "$pkgdir/usr/share/licenses/$pkgname/EULA.htm"

  cd "${srcdir}"
  install -D -m755 "CodeXL.sh" "$pkgdir/usr/bin/CodeXL"
  install -D -m755 "codexl.png" "$pkgdir/usr/share/pixmaps/codexl.png"
  install -D -m755 "codexl.desktop" "$pkgdir/usr/share/applications/codexl.desktop"
}