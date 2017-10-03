# Maintainer: Caio Prado <cagprado at gmail dot com>
pkgname=deezer-native-sdk
pkgver=1.2.10
pkgrel=1
pkgdesc="Software development kit for the Deezer's API."
arch=('i686' 'x86_64')
url="https://developers.deezer.com/"
license=('custom')
depends=('libpulse')
source=("https://build-repo.deezer.com/native_sdk/${pkgname}-v${pkgver}.zip")
sha256sums=('6198ae56778f9ef39c1d7e2e6d23d779a245c19742e58cf85dd2ad0662e45cae')

if [ "$CARCH" = "i686" ]; then
  DEEZER_ARCH="i386"
else
  DEEZER_ARCH="$CARCH"
fi

package() {
  cd "$srcdir/$pkgname-v$pkgver"

  install -Dm644 "SDK/Include/deezer-api.h" "$pkgdir/usr/include/$pkgname/deezer-api.h"
  install -Dm644 "SDK/Include/deezer-connect.h" "$pkgdir/usr/include/$pkgname/deezer-connect.h"
  install -Dm644 "SDK/Include/deezer-object.h" "$pkgdir/usr/include/$pkgname/deezer-object.h"
  install -Dm644 "SDK/Include/deezer-offline.h" "$pkgdir/usr/include/$pkgname/deezer-offline.h"
  install -Dm644 "SDK/Include/deezer-offline-sync.h" "$pkgdir/usr/include/$pkgname/deezer-sync.h"
  install -Dm644 "SDK/Include/deezer-player.h" "$pkgdir/usr/include/$pkgname/deezer-player.h"
  install -Dm644 "SDK/Include/deezer-track.h" "$pkgdir/usr/include/$pkgname/deezer-track.h"
  install -Dm755 "SDK/Bins/Platforms/Linux/$DEEZER_ARCH/libdeezer.so" "$pkgdir/usr/lib/libdeezer.so"
  install -Dm644 "Licenses/all.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/docs"
  cp -dr --no-preserve=ownership "Docs" "$pkgdir/usr/share/docs/$pkgname"
}
