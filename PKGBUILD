# Maintainer: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd
pkgver=1.9.4a37
pkgrel=1
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64')
depends=('tcsh' 'perl' 'libxi' 'tcl' 'libxinerama' 'libgl' 'glu')
makedepends=('make')
optdepends=('netcdf: MMTK and AMBER 9 trajectories support'
            'openbabel: additional file formats support'
            'sqlite: dmsplugin')
# You MUST download the package from the VMD url and put it in the PKGBUILD folder!
# Current download should be:
# LINUX_64 OpenGL, CUDA, OptiX RTX, OSPRay (Linux (RHEL 6.7 and later) 64-bit Intel/AMD x86_64 SSE, with CUDA 9.x, OptiX, OSPRay)
source=("local://${pkgname}-${pkgver}.bin.LINUXAMD64-CUDA9-OptiX600-RTX-OSPRay170.opengl.tar.gz")
sha256sums=('684c35a9bfdfb1bc26ab9628d55725e9b6bdfdfbd573055ab8d15aad713a9702')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  export VMDINSTALLBINDIR="${pkgdir}/usr/bin"
  export VMDINSTALLLIBRARYDIR="${pkgdir}/usr/lib/vmd"
  ./configure
  cd src; make install
  sed -i 's|set defaultvmddir=.*|set defaultvmddir=/usr/lib/vmd|' "${pkgdir}/usr/bin/vmd"
}
