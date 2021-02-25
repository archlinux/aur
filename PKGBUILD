# Maintainer: Kiran Shila <me at kiranshila dot com>
pkgname=casa5-bin
pkgver=5.7.2
pkgrel=4
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=()
conflict=('')
instdir="/opt/${pkgname}"
provides=("casa")
source=("https://casa.nrao.edu/download/distro/casa/release/el7/casa-release-${pkgver}-${pkgrel}.el7.tar.gz")
md5sums=('89292f54d777ccde2f9b9b22b445a1e1')
package() {
  # Copy out files
  install -m755 -d "${pkgdir}/${instdir}"
  rsync -a --no-o --no-g "${srcdir}/casa-release-${pkgver}-${pkgrel}.el7/" "${pkgdir}/${instdir}"
  # Symlink executables
  install -m755 -d "${pkgdir}/usr/bin/"
  for _executable in casa casa-config mpicasa; do
    ln -s "${instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done 
}
