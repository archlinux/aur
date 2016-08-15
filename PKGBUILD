# Maintainer: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.1.7
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
sha256sums_i686=('301da4be5a39aad202e28d2119d897b2c8919b37185a218c813e70f651987cd3')
sha256sums_x86_64=('45efb7101733ec8b547a13bce0263065c3fe22e5e549eb4899585acb2bab7b80')
source_i686=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian32.deb")
source_x86_64=("http://www.ocenaudio.com.br/downloads/ocenaudio_archlinux.pkg.tar.xz")

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
    rm -f ${pkgdir}/ocenaudio_archlinux.pkg.tar.xz
  fi
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm "${pkgdir}/LICENSE.txt"
}
