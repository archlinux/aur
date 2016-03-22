# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=nwchem-data
pkgver=6.6.r27746.2
_pkgver=6.6+r27746-2
pkgrel=1
pkgdesc="Open Source High-Performance Computational Chemistry (basis sets, FF params needed for Debian binary build)"
arch=("any")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
options=("!strip" "libtool" "staticlibs")
source=("http://http.us.debian.org/debian/pool/main/n/nwchem/nwchem-data_${_pkgver}_all.deb")
sha256sums=('c14cc7abcaf52f719c2019f4a6c448e55ba92b97e73753409001ace3f1942189')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Extracting documentation..."
  gunzip "${pkgdir}"/usr/share/doc/nwchem/userpdf.pdf.gz

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}"/usr/share/doc/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  msg2 "Removing Debian extras..."
  rm -r "${pkgdir}"/usr/share/lintian
  rm -r "${pkgdir}"/usr/share/doc/"${pkgname}"
}
