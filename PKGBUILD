# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.4.2
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'jack' 'pulseaudio'
         'qt5-base' 'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("LICENSE.txt")
sha256sums=('SKIP')
sha256sums_i686=('1e9df54252d28ed33d175cb19a2a53ed46cf77dfc12880b0ac782b4b6c00ec1e')
sha256sums_x86_64=('b9ba86760ce8f402f1104291cad4df9f01c0dfe2951da3620f4561498b247aac')
source_i686=("${_pkgname}-${pkgver}_i686.deb::http://www.ocenaudio.com.br/downloads/ocenaudio_debian32.deb")
source_x86_64=("${_pkgname}-${pkgver}_x86_64.pkg.tar.xz::http://www.ocenaudio.com.br/downloads/ocenaudio_archlinux.pkg.tar.xz")

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
    rm -f ${pkgdir}/${_pkgname}-${pkgver}_x86_64.pkg.tar.xz
  fi
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  if [ -f "${pkgdir}/LICENSE.txt" ]; then
    rm -f "${pkgdir}/LICENSE.txt"
  fi
}
