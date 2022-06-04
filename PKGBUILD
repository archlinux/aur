# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=nwchem-data
_pkgver=7.0.2-1
_pkgver_tmp="${_pkgver//\+/\.}"
pkgver="${_pkgver_tmp//-/\.}"
pkgrel=1
pkgdesc="Open Source High-Performance Computational Chemistry (basis sets, FF params needed for Debian binary build)"
arch=("any")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
options=("!strip" "libtool" "staticlibs")
source=("http://http.us.debian.org/debian/pool/main/n/nwchem/nwchem-data_${_pkgver}_all.deb")
sha256sums=('08ffd4c18948e56619b54cabb7bf23e6a0b5aa902b9aa45b109b21ccc3086987')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}"/usr/share/doc/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  msg2 "Removing Debian extras..."
  rm -r "${pkgdir}"/usr/share/doc
  rm -r "${pkgdir}"/usr/share/lintian
}
