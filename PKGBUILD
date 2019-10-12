# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname"
pkgver=3.7.5
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com/"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'jack' 'libpulse' 'openssl-1.0' 'qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
sha256sums_i686=('d47c58f9baf081454f90aab644cae3522169fa0da7d188b31a1b377a4db8565b')
sha256sums_x86_64=('ec91f699abe4cac3eb3151fd0354594a7c176f73b9818fdac15c76f36e736167')
source_i686=("${_pkgname}-${pkgver}_i686.deb::http://www.ocenaudio.com/downloads/index.php/ocenaudio_debian32.deb?version=${pkgver}")
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.xz::http://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.xz?version=${pkgver}")

build() {
  echo "ocenaudio "$pkgver
}

package() {
  if [ $CARCH == "i686" ]; then
    tar -xJf ${srcdir}/data.tar.xz -C "${pkgdir}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/$_pkgname/bin/${_pkgname}" "${pkgdir}/usr/bin"
    rm -rf "${pkgdir}/var"
  else
    cp -rLnf ${srcdir}/* ${pkgdir}/
    rm -f ${pkgdir}/${_pkgname}-${pkgver}_x86_64.tar.xz
  fi
  install -dm755 "${pkgdir}/usr/share/licenses"
  install -Dm644 "${pkgdir}/opt/$_pkgname/bin/ocenaudio_license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -f "${pkgdir}/opt/$_pkgname/bin/ocenaudio_license.txt"
}
