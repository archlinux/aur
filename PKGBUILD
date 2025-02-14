# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
pkgname=casa6-pipeline-bin
pkgver=6.6.1
ver_=17
pipever=2024.1.0.8
pkgrel=2
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=('lsb-release' 'libselinux' 'libxcrypt-compat') 
conflict=("casa6-bin")
provides=("casa")
instname="casa-${pkgver}-${ver_}-pipeline-${pipever}"
source=("https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/${instname}-py3.8.el8.tar.xz")
md5sums=("470d42aa93c2b89ff2279ca481136657")
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
