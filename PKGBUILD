# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
pkgname=casa6-bin
pkgver=6.5.6
ver_=22
pkgrel=1
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=('lsb-release' 'libselinux')
conflict=("casa")
provides=("casa")
instname="casa-${pkgver}-${ver_}-py3.8.el8"
source=("https://casa.nrao.edu/download/distro/casa/release/rhel/${instname}.tar.xz")
md5sums=("7c01de29d983fd27e4bb19d4e8286c3b")
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

  #Ading /etc/profile
  mkdir -p ${pkgdir}/etc/profile.d
  echo alias casa-python3=${instdir}/${instname}/bin/python3 >> ${pkgdir}/etc/profile.d/casa.sh
  echo alias casa-python3=${instdir}/${instname}/bin/python3
  chmod +x ${pkgdir}/etc/profile.d/casa.sh
}
