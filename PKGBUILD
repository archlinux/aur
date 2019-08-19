# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname"
pkgver=3.7.3
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com/"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'jack' 'libpulse' 'openssl-1.0' 'qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
sha256sums_i686=('4f9650721400df6c31782e29dce2d92b60899b31c451ceeec06838f21c09fef9')
sha256sums_x86_64=('678834567a77559b34f3c12d22e8bde5ac81bc13745cba82db4f72b3e94e9c3f')
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
