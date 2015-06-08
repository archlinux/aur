# Maintainer: Vi0L0 <vi0l093@gmail.com>
# GREAT Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

# PKGEXT='.pkg.tar.gz'  # imho time to pack this pkg into tar.xz is too long, unfortunatelly yaourt got problems when ext is different from .pkg.tar.xz - V

pkgname=amdapp-codexl
pkgver=1.7
pkgrel=7300
pkgdesc="AMD CodeXL is an OpenCL and OpenGL Debugger and Profiler, with static OpenCL kernel analyzer. It supports OpenCL 2.0"
arch=('x86_64')
url="http://developer.amd.com/tools/heterogeneous-computing/codexl/"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
groups=('amdapp')
depends=('libpng' 'libgl' 'libcl')
source=(http://developer.amd.com/download/AMD_CodeXL_Linux_x86_64_$pkgver.$pkgrel.tar.gz
      CodeXL.sh
      codexl.png
      codexl.desktop)
  md5sums=('4cad77368f23f755e297628e4f0a1283'
      'aa9e53ea4c6fca125fbedaf6d968a76a'
      '34792207ff65c7b2314a9bd8cbeb4e1f'
      'a80e16b7378abdd3e0d6d34e485246e1')

#Install path
_ipath='opt/AMDAPP/CodeXL'

package() {
  mkdir -p "${pkgdir}/${_ipath}"
  cd "${srcdir}/AMD_CodeXL_Linux_x86_64_$pkgver.$pkgrel/"
  cp -a *  "${pkgdir}/${_ipath}"
  install -D -m644 "Legal/CodeXLEndUserLicenseAgreement-Linux.htm" "$pkgdir/usr/share/licenses/$pkgname/EULA.htm"

  cd "${srcdir}"
  install -D -m755 "CodeXL.sh" "$pkgdir/usr/bin/CodeXL"
  install -D -m755 "codexl.png" "$pkgdir/usr/share/pixmaps/codexl.png"
  install -D -m755 "codexl.desktop" "$pkgdir/usr/share/applications/codexl.desktop"
}