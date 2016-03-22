# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
pkgname=${_pkgname}-bin
pkgver=6.6.r27746.2
_pkgver=6.6+r27746-2
pkgrel=1
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
    _sha256sum='1b19f6e6ac88b093698bff41aed898fee8ff4f31af908d4c396a70b95504336d'
    ;;
  "x86_64")
    _arch='amd64'
    _sha256sum='aa5b19b249a261797dca8a8b8c8b4c99fa991b79a330df5399252379197ca745'
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
