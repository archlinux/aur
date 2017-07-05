# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
pkgname=${_pkgname}-bin
pkgver=6.6.r27746.4
_pkgver=6.6+r27746-4
pkgrel=3
pkgdesc="Open Source High-Performance Computational Chemistry (Debian binary build)"
arch=("i686" "x86_64")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
depends=("lapack" "python2" "openmpi" "nwchem-data" "libgfortran6")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip" "libtool" "staticlibs")
case "${CARCH}" in
  "i686")
    _arch='i386'
    _sha256sum='1969ed65c4d0600e07586f0e3524a7aface67e33a5ff215c3299bdbca5ad72af'
    ;;
  "x86_64")
    _arch='amd64'
    _sha256sum='e03f23084989af72123437e8cd408f4458a131bb67a081fa04f02ff42ede8d9a'
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
