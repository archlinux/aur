# Maintainer: Peter Petrov <onestone@gmail.com>
# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.10.0
_strver=0-10-0
pkgrel=2
pkgdesc="Ethereum wallet and Dapp browser."
arch=('x86_64')
depends=(
  'alsa-lib'
  'gconf'
  'gtk2'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
)
provides=(
  'mist'
)
conflicts=(
  'mist-git'
)
optdepends=(
  'geth: The go-ethereum commandline client (geth cli).'
  'parity: The fast, light, robust Ethereum client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
sha256sums=('f127e5cf6aa87d26c66c3e4d338a50d37670158fba496b44731dbae68e3c6106'
            '02dd222eae64cc6ceb2d954f34e1ff49654b55951f49875408ffe2bf1cf13423'
            '0b3bebf887730b51c82ad37d58550908563000ad134b22738f4cb91375c96790')
source=(
  "${pkgname}-${_strver}-64.zip::https://github.com/ethereum/${pkgname}/releases/download/v${pkgver}/Mist-linux64-${_strver}.zip"
  "mist.desktop"
  "mist.png"
)

package() {
  msg2 'Installing Mist...'
  install -d "${pkgdir}/opt/mist"
  cp -a "${srcdir}/." "${pkgdir}/opt/mist"
  rm ${pkgdir}/opt/mist/mist-*.zip ${pkgdir}/opt/mist/mist.desktop ${pkgdir}/opt/mist/mist.png
  install -d "${pkgdir}/usr/share/applications"
  cp -aL "${srcdir}/mist.desktop" "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  cp -aL "${srcdir}/mist.png" "${pkgdir}/usr/share/pixmaps"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/mist/mist" "${pkgdir}/usr/bin/mist"
}
