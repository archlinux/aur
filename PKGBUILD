# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.5.3
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
sha256sums_i686=('f949f2a92074b5091aa1e92e2fe6e66ff169000313a7b64174395b2b6c4e96fd')
sha256sums_x86_64=('f88d2d7214258ebea74fa4cc34312e37fc03931fdb31322e22ae25e3d5b5c4cd')
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
