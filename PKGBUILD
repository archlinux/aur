# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.2.0
pkgrel=2
pkgdesc='HUSH desktop full node GUI wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("$url/archive/v$pkgver.tar.gz"
        'silentdragon.png'
        'silentdragon.desktop')
sha256sums=('7f2280d69b64cff73d362da194c529ccc6ca233113c0105604c8c9e1609dcbf5'
            'c3c7acc348f662f6b57594a300f1151a95c8369ea140c220d211fa362126d915'
            'c6928cae0d7518877fd05610a8e7ec9c143c36f05cc93babdc23ce01c8aa6435')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "silentdragon"
  ./build.sh linguist
  ./build.sh release
}

package() {
  install="${pkgbase}.install"
  install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/chromium.desktop"
  install -Dm644 "${srcdir}/$pkgname-icon.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"

  cd "silentdragon"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /opt/${pkgname}/silentdragon "${pkgdir}/usr/bin"
}

