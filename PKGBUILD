# Author: JokerYu <dayushinn@gmail.com>
# Maintainer: Olivier Bilodeau <obilodeau@gosecure.ca>
pkgname=forticlientsslvpn
pkgver=4.4.2323
pkgrel=1
epoch=1
pkgdesc="Fortinet SSL VPN Client for linux"
arch=("i686" "x86_64")
url="https://support.fortinet.com"
license=("custom")
depends=("ppp" "net-tools" "libsm" "gtk2")
optdepends=("gtk-engines: for gtk theme support")

_versionFix=4.4.2323
_sourceName=${pkgname}_linux_${_versionFix}.tar.gz

if [ "$CARCH" = "i686" ]; then
  _arch=32bit
elif [ "$CARCH" = "x86_64" ]; then
  _arch=64bit
fi

md5sums=('1b14d68d8026b00652fdcbb4c77ba832'
         'ba87cd86fec77062c0d20da95c9e21f6'
         '6f5ebe493c5abaf60bfcd2b8bc9d73fc'
         '03f0d0ade9b76776a39d9162d5708f97'
         '43f95eae96db16248d7294c1e8bfc561')

_tarballsrc="http://michele.cereda.info/downloads/work/buongiorno/${_sourceName}"
# _tarballsrc="ftp://pftpintl:sgn89IOngs@support.fortinet.com/FortiGate/v5.00/5.2/5.2.2/VPN/SSLVPNTools/${_sourceName}"
# _tarballsrc="http://www.zen.co.uk/userfiles/knowledgebase/FortigateSSLVPNCLient/${_sourceName}"
# _tarballsrc="http://support.safe-t.com/forticlients/${_sourceName}"

source=(
  "${_tarballsrc}"
  "${pkgname}.sh"
  "${pkgname}_cli.sh"
  "${pkgname}.desktop"
  "${pkgname}.png"
)

package() {
  _srcpath=${srcdir}/${pkgname}/${_arch}

  cd ${_srcpath}/helper

  msg "creating path and copying files..."

  mkdir -p ${pkgdir}/opt/fortinet/${pkgname}/icons
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cp -rp ${_srcpath}/* ${pkgdir}/opt/fortinet/${pkgname}

  chmod 555 ${pkgdir}/opt/fortinet/${pkgname}/helper

  install -Dm 644 ${srcdir}/${pkgname}.png ${pkgdir}/opt/fortinet/${pkgname}/icons/
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm 644 ${_srcpath}/helper/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${srcdir}/${pkgname}_cli.sh ${pkgdir}/usr/bin/${pkgname}_cli
}
