# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=nwchem-data
pkgver=6.6.r27746.4
_pkgver=6.6+r27746-4
pkgrel=1
pkgdesc="Open Source High-Performance Computational Chemistry (basis sets, FF params needed for Debian binary build)"
arch=("any")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
options=("!strip" "libtool" "staticlibs")
source=("http://http.us.debian.org/debian/pool/main/n/nwchem/nwchem-data_${_pkgver}_all.deb")
sha256sums=('8205a8fce93676378dd0bc7c28e0314064c8ed7ffdd2afd0f15aad555fe8e209')

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
