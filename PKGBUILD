# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=2.0.16
pkgrel=1
pkgdesc="cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://loopauditioneer.sourceforge.net/"
license=('custom')
depends=('alsa-lib' 'desktop-file-utils' 'gcc-libs-multilib'
         'gtk-update-icon-cache' 'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=("$_pkgname.install")

if [[ $CARCH == 'i686' ]]; then
  _arch=32
  sha256sums=('5aae40b170a889f9115a61e2431b975ebc3b4354d59a88e65966550768c1ea86')
elif [[ $CARCH == 'x86_64' ]]; then
  _arch=64
  sha256sums=('f750b8a04a94259e5535a9a4cc2b8b276c924ccadad0b7f3da3407614a3aff68')
fi

source=("http://www.ocenaudio.com.br/downloads/ocenaudio${_arch}.deb")

package() {
  tar -xzf ${srcdir}/data.tar.gz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  rm -f "${pkgdir}/opt/$_pkgname/bin/$_pkname.cfg"
  mv "${pkgdir}/opt/$_pkgname/bin/"* "${pkgdir}/usr/bin"
  mv "${pkgdir}/opt/$_pkgname/lib/"* "${pkgdir}/usr/lib"
  sed -i -e 's|/opt/ocenaudio/bin/||' \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "${pkgdir}/opt/$_pkgname/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -rf "${pkgdir}/opt"
  rm -rf "${pkgdir}/usr/share/menu"
}

