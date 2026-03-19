# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
pkgname=casa6-pipeline-bin
pkgver=6.6.6
ver_=18
pipever=2025.1.0.36
pkgrel=2
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=('lsb-release' 'libselinux' 'libxcrypt-compat') 
conflict=("casa6-bin")
provides=("casa")
instname="casa-${pkgver}-${ver_}-pipeline-${pipever}-py3.10.el8"
source=("https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/${instname}.tar.xz")
md5sums=("56e134ba6ffcf45bbaefafd25fb0d1de")
instdir="/opt"
options=("!strip")
package() {
  # Copy out files
  mkdir -p "${pkgdir}/${instdir}"
  cp -r  "${srcdir}/${instname}" "${pkgdir}/${instdir}"

  # Symlink executables
  mkdir -p "${pkgdir}/usr/bin/"
  for _executable in casa casaviewer mpicasa; do
    ln -s "${instdir}/${instname}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  echo "For use with Python, add to your bashrc:"
  echo alias casa-python=${instdir}/${instname}/bin/python3
  echo alias casa-pip=${instdir}/${instname}/bin/pip3
}
