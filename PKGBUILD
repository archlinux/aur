# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.0.2
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'pulseaudio' 'qt5-base'
         'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=("$_pkgname.install")
if [[ $CARCH == 'i686' ]]; then
  _arch=32
  sha256sums=('ce2efe35d3dede50eaeb2a36fa46d757ae720cce0b25f152c20526ff6c653b1b')
elif [[ $CARCH == 'x86_64' ]]; then
  sha256sums=('7f85d726b3a0b6699df22cacc61e6822b275e0346b3951ed8026befadd1fa51f')
  _arch=64
fi

source=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian${_arch}.deb"
        "LICENSE.txt")
sha256sums+=('056a0443fc2a8a562d193dd1acdc99933b9ceada4f8f544f89c314253b117801')

package() {
  tar -xJf ${srcdir}/data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/$_pkgname/bin/${_pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -rf "${pkgdir}/var"
}
