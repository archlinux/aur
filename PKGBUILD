# Maintainer: Michele Cereda <cereda.michele@gmail.com>
# Contributor: JokerYu <dayushinn@gmail.com>, Olivier Bilodeau <obilodeau@gosecure.ca>
pkgname=forticlientsslvpn
pkgver=4.4.2330
pkgrel=1
epoch=1
pkgdesc="Fortinet SSL VPN Client for linux"
arch=("i686" "x86_64")
url="https://support.fortinet.com"
license=("custom")
depends=("ppp" "net-tools" "libsm" "gtk2")
optdepends=("gtk-engines: for gtk theme support" "gnome-themes-standard: for theming")

_sourceName=${pkgname}_linux_${pkgver}.tar.gz

if [ "$CARCH" = "i686" ]; then
  _arch=32bit
elif [ "$CARCH" = "x86_64" ]; then
  _arch=64bit
fi

sha256sums=('b07d9b431f6fa481cd8f82e5a3d76ff4552bf1c65d3fe80615f5449e2d2005c9'
            '5d4737629cadf38194ffc68d927a202cbac5f9fbcf825f11407c00e6a15842fb'
            '92f0dcc5431221d6832220b3ddec8d9606fff9ded4f8590eabd1c9ff3e37cb8b'
            '4f63f4503dca7633a4d7a1cf874ede1f33f877a701813349c5cd63889151f4a2'
            '15d46db76a39f32736ee3a469fc1b821e6290453c701af823875a493d06901df')

_tarballsrc="https://github.com/mcereda/forticlientsslvpn/raw/master/tarball/${_sourceName}"  # Fortinet does not permit to download it directly

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
