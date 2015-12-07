# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.0
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
  sha256sums=('3b4ca5529f5bdc992c27b8551b36ae80bfe52d633902fcb2d7c7ae47d20e519e')
elif [[ $CARCH == 'x86_64' ]]; then
  _arch=64
  sha256sums=('6d038f22385a81e0bd47a802e964bdc77c1dde875732d0f86895c93e985df587')
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
