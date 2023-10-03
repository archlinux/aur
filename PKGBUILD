# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
pkgname=casa6-bin
pkgver=6.6.0
ver_=20
pkgrel=1
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=('lsb-release' 'libselinux')
conflict=("casa")
provides=("casa")
instname="casa-${pkgver}-${ver_}-py3.8.el7"
source=("https://casa.nrao.edu/download/distro/casa/release/rhel/${instname}.tar.xz")
md5sums=("4574fd6367749218b8bfd46b25903eb8")
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
