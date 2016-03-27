# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=psi3
pkgname=${_pkgname}-bin
pkgver=3.4.0.6
_pkgver=3.4.0-6
pkgrel=1
pkgdesc="An open-source program for computing molecular properties using high-accuracy, ab initio, quantum mechanical models. (Debian binary build)"
arch=("i686" "x86_64")
url="https://sourceforge.net/projects/psicode/"
license=("GPL2")
depends=("gcc-libs" "lapack")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip" "libtool" "staticlibs")
case "${CARCH}" in
  "i686")
    _arch='i386'
    _sha256sum='825ccea23bad7cb7808c0f62d5041c64ac15d9cc8cbb6faefc858995e01340d2'
    ;;
  "x86_64")
    _arch='amd64'
    _sha256sum='174c245674c2e81326e66f4547c505305d10882fb9e5ae968dbe34924ab7316a'
    ;;
esac
source=("http://ftp.us.debian.org/debian/pool/main/p/psicode/${_pkgname}_${_pkgver}_${_arch}.deb")
sha256sums=("${_sha256sum}")

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
