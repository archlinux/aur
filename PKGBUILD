# Maintainer: edombek <edombek@yandex.ru>
pkgname=casa6
pkgver=6.5.0
pkgrel=15
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=()
conflict=('')
instdir="/opt/${pkgname}"
provides=("casa")
source=("https://casa.nrao.edu/download/distro/casa/release/rhel/casa-${pkgver}-${pkgrel}-py3.8.tar.xz")
md5sums=('e7dd512ffcbcffe6e36c6fc295b2d7de')
package() {
  # Copy out files
  install -m755 -d "${pkgdir}/${instdir}"
  rsync -a --no-o --no-g "${srcdir}/casa-${pkgver}-${pkgrel}-py3.8/" "${pkgdir}/${instdir}"
  # Symlink executables
  install -m755 -d "${pkgdir}/usr/bin/"
  for _executable in buildmytasks  casa  casaviewer  mpicasa; do
    ln -s "${instdir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done 
}
