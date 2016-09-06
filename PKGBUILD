# Maintainer: Michele Cereda <cereda.michele@gmail.com>
# Contributor: JokerYu <dayushinn@gmail.com>, Olivier Bilodeau <obilodeau@gosecure.ca>
pkgname=forticlientsslvpn
pkgver=4.4.2329
pkgrel=1
epoch=1
pkgdesc="Fortinet SSL VPN Client for linux"
arch=("i686" "x86_64")
url="https://support.fortinet.com"
license=("custom")
depends=("ppp" "net-tools" "libsm" "gtk2")
optdepends=("gtk-engines: for gtk theme support")

_sourceName=${pkgname}_linux_${pkgver}.tar.gz

if [ "$CARCH" = "i686" ]; then
  _arch=32bit
elif [ "$CARCH" = "x86_64" ]; then
  _arch=64bit
fi

sha256sums=('95bb2148130c0eaf51353f4adc9da5032c06af3a5ea8e44c06d0e06439afc635'
            '5742a8ae7dde1a1fde698ce2108ade9b51d497579c1e4375ff928325112a8780'
            '18061ae130992bfdd1b2fc18b2a6cd64e9ee6da63dae28cee1c28f2a40b60b15'
            '4f63f4503dca7633a4d7a1cf874ede1f33f877a701813349c5cd63889151f4a2'
            '15d46db76a39f32736ee3a469fc1b821e6290453c701af823875a493d06901df')

_tarballsrc="https://github.com/mcereda/forticlientsslvpn/raw/master/tarball/${_sourceName}"
# from Fortinet's firmware download site: /FortiGate/v5.00/5.2/5.2.7/VPN/SSLVPNTools/${_sourceName}

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
