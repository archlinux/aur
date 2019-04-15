# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.6
pkgrel=2
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
sha256sums_i686=('999963e59cd4e783b2542d29901fa8ab11259f9e86d2341e216b729b16f3377c')
sha256sums_x86_64=('1082ffd06d15d4c066ce2df056e648f8b2a463d4305e3d7cf0ffc4967002dcca')
source_i686=("${_pkgname}-${pkgver}_i686.deb::http://www.ocenaudio.com/downloads/ocenaudio_debian32.deb")
source_x86_64=("${_pkgname}-${pkgver}_x86_64.pkg.tar.xz::http://www.ocenaudio.com/downloads/ocenaudio_archlinux.pkg.tar.xz")

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
