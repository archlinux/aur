# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=psi3
pkgname=${_pkgname}-bin
pkgver=3.4.0.6
_pkgver=3.4.0-6+b2
pkgrel=2
pkgdesc="An open-source program for computing molecular properties using high-accuracy, ab initio, quantum mechanical models. (Debian binary build)"
arch=("x86_64")
url="https://sourceforge.net/projects/psicode/"
license=("GPL2")
depends=("gcc-libs" "lapack")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip" "libtool" "staticlibs")
source=("http://ftp.us.debian.org/debian/pool/main/p/psicode/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=('b2e5ad439d2598f57927378b8ab19a2aa27a8a18c75fa74386443a4677f0a23d')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Extracting documentation..."
  gunzip "${pkgdir}"/usr/share/doc/"${_pkgname}"/userman.ps.gz

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}"/usr/share/doc/"${_pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  msg2 "Removing Debian extras..."
  rm -r "${pkgdir}"/usr/share/doc-base
  rm "${pkgdir}"/usr/share/doc/"${_pkgname}"/copyright
  rm "${pkgdir}"/usr/share/doc/"${_pkgname}"/changelog.Debian.gz
}
