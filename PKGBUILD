# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
pkgname=${_pkgname}-bin
pkgver=6.6.r27746.2
_pkgver=6.6+r27746-2+b1
pkgrel=2
pkgdesc="Open Source High-Performance Computational Chemistry (Debian binary build)"
arch=("i686" "x86_64")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
depends=("lapack" "python2" "openmpi" "nwchem-data")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip" "libtool" "staticlibs")
case "${CARCH}" in
  "i686")
    _arch='i386'
    _sha256sum='fa072e9dba383bafaeafb5cfcf38f4fcf5d945760275be334e29941d75d837a3'
    ;;
  "x86_64")
    _arch='amd64'
    _sha256sum='e90a6b1ae559867c62fb947f4567a93b3f1de9a6e1a8934228032dd6c1b1bdf6'
    ;;
esac
source=("http://ftp.us.debian.org/debian/pool/main/n/nwchem/nwchem_${_pkgver}_${_arch}.deb")
sha256sums=("${_sha256sum}")

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}"/usr/share/doc/"${_pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  msg2 "Removing Debian extras..."
  rm -r "${pkgdir}"/usr/share/lintian
  rm -r "${pkgdir}"/usr/share/doc-base
}
