# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.5.2
pkgrel=1
pkgdesc='HUSH Lite wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'hushdlogo.png'
        'silentdragonlite.png'
        'silentdragonlite.desktop')
sha256sums=('78a6eb21cc6d59421553fae090c2425794606b8d9f93f4acd990dc9595bba8af'
            '4fe06d6d697a5073d3cb120d11f1caef22f87d7df6845052bd1bafbeb3506489'
            'c3c7acc348f662f6b57594a300f1151a95c8369ea140c220d211fa362126d915'
            '6f5c84eed3eb718a1480df7f9b6ace15757bfcfded41c2d369da4b3175ec4c76')

build() {
  # upstream is missing this file in the release.tar.gz & it needs it to build
  cp "$srcdir/hushdlogo.png" "$pkgname/res/hushdlogo.png"
  cd "$pkgname"
  ./build.sh linguist
  ./build.sh
}

package() {
  install -Dm755 "${srcdir}/$pkgname/SilentDragonLite" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/opt/$pkgname/$pkgname.png"

  # links to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragonlite "${pkgdir}/usr/bin"
}
