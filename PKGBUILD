#Maintainer: steabert <steabert@member.fsf.org>
#Contributor: Ricardo Honorato Z.
pkgname=vmd
pkgver=1.9.2
pkgrel=1
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('i686' 'x86_64')
depends=('tcsh' 'perl' 'libxi' 'tcl' 'libxinerama' 'mesa-libgl' 'glu')
makedepends=('make')
optdepends=('netcdf: MMTK and AMBER 9 trajectories support'
            'openbabel: additional file formats support'
            'sqlite: dmsplugin')

# You MUST download the package from the VMD url and put it in the PKGBUILD folder!
[ "$CARCH" = "i686" ] && source=(${pkgname}-${pkgver}.bin.LINUX.opengl.tar.gz)
[ "$CARCH" = "x86_64" ] && source=(${pkgname}-${pkgver}.bin.LINUXAMD64.opengl.tar.gz)

[ "$CARCH" = "i686" ] && md5sums=('e14abdbf5b8062d657f2a9cb4004e37d')
[ "$CARCH" = "x86_64" ] && md5sums=('ff8b8a761822ebbb9be0e9f450d123b0')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  export VMDINSTALLBINDIR="${pkgdir}/usr/bin"
  export VMDINSTALLLIBRARYDIR="${pkgdir}/usr/lib/vmd"
  ./configure
  cd src; make install
  sed -i 's|set defaultvmddir=.*|set defaultvmddir=/usr/lib/vmd|' "${pkgdir}/usr/bin/vmd"
}
