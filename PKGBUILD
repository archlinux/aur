# Maintainer: Evgeniy Dombek <edombek@yandex.ru>
pkgname=casa6-bin
pkgver=6.5.5
pkgrel=21
pkgdesc="NRAO's Common Astronomy Software Applications package"
url="https://casa.nrao.edu/"
arch=('x86_64')
license=('GPL')
depends=('lsb-release' 'libselinux')
conflict=("casa")
provides=("casa")
source=("https://casa.nrao.edu/download/distro/casa/release/rhel/casa-${pkgver}-${pkgrel}-py3.8.tar.xz")
md5sums=('b28fa7a137eefdac0aab887031fc6983')
instdir="/opt"
options=("!strip")
package() {
  # Copy out files
  mkdir -p "${pkgdir}/${instdir}"
  cp -r  "${srcdir}/casa-${pkgver}-${pkgrel}-py3.8" "${pkgdir}/${instdir}"

  # Symlink executables
  mkdir -p "${pkgdir}/usr/bin/"
  for _executable in casa casaviewer mpicasa; do
    ln -s "${instdir}/casa-${pkgver}-${pkgrel}-py3.8/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done

  #Ading /etc/profile
  mkdir -p ${pkgdir}/etc/profile.d
  echo alias casa-python3=${instdir}/casa-${pkgver}-${pkgrel}-py3.8/bin/python3 >> ${pkgdir}/etc/profile.d/casa.sh
  echo alias casa-python3=${instdir}/casa-${pkgver}-${pkgrel}-py3.8/bin/python3
  chmod +x ${pkgdir}/etc/profile.d/casa.sh
}
