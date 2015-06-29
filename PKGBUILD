# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=safesignidentityclient
pkgver=3.0.77
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('i686' 'x86_64')
url="http://www.validcertificadora.com.br/SafeSignLinux"
license=('custom:copyright')
depends=('pcsclite' 'gdbm183' 'wxgtk2.8' 'xdg-utils')
depends_x86_64=('gcc-libs-multilib')
makedepends=('deb2targz')
source_i686=("http://www.validcertificadora.com.br/upload/downloads/linux32bits/${pkgname}_${pkgver}-Ubuntu_i386.deb")
source_x86_64=("http://www.validcertificadora.com.br/upload/downloads/linux64bits/${pkgname}_${pkgver}-Ubuntu_amd64.deb")
install=('safesign.install')
sha512sums_i686=("65bbf08c0049f55c6fe4f781e8e50ed3cd576fbf3e7f7fd9a8a525a8e15fd2c53fa2543bcc255b8ebffa87e98a203d0c71f6d4d09a69a1020be631956fad838f")
sha512sums_x86_64=("ec635d3d25a8c8670273db83ecdb96a6c0fde0693a2b1745f9c0930941431b6ed1a2af3a24b0631cac3c75fb59126c9a60b844fdd426b3cab1c41c1d51a63519")

build() {
  cd ${srcdir}
  local _filename
  if [[ arch == "i686" ]]; then
    _filename=${pkgname}_${pkgver}-Ubuntu_i386
  else
    _filename=${pkgname}_${pkgver}-Ubuntu_amd64
  fi

  # Use deb2targz to extract the beefy parts of the files
  deb2targz $_filename.deb
  tar xvf $_filename.tar.gz
}

package() {
  cd ${pkgdir}

  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
