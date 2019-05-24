# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname"
pkgver=3.6.4
pkgrel=2
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com/"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'jack' 'libpulse' 'openssl-1.0'
         'qt5-base' 'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
sha256sums_i686=('f5432be44dfdadb4ea7ffe1b20e04a1c17eb1d1a55a0507296fb3464adc1487a')
sha256sums_x86_64=('049ea77b5ac7177b3107456eb527815a0873f5f00ccb303a28402ea8920a9c44')
source_i686=("${_pkgname}-${pkgver}_i686.deb::http://www.ocenaudio.com/downloads/index.php/ocenaudio_debian32.deb")
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.xz::http://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.xz")

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
