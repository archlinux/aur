# Maintainer: Sergey Shatunov <me@aur.rocks>
pkgname=lampa
pkgver=1.4.1
pkgrel=1
pkgdesc="Lampa - movies & serials tracker, indexer and player"
arch=(x86_64)
url="http://lampa.mx"
license=('custom')
depends=('nwjs-bin')
makedepends=('libarchive')
source=("$pkgname-$pkgver.zip::https://github.com/yumata/$pkgname/releases/download/v$pkgver/$pkgname-portable.zip"
        "lampa"
        "lampa.desktop")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('28954740abbd36e38bbcdeff55ce832968ef24d35ecfb4e51353d9de5edf99d1'
            'ffdcbc992611975481b098fbae4914bbd4e374ff54d482a9ad45248951d6c858'
            '0225abec9f78f980407da87762cb76cbfb5442288cc0267701a905a2e9ce8db9')

package() {
  install -d "$pkgdir/usr/share/$pkgname/"
  bsdtar -C "$pkgdir/usr/share/$pkgname/" -xf "$srcdir/$pkgname-$pkgver.zip"
  
  # Delete windows stuff
  find "$pkgdir/usr/share/$pkgname/" -name '*.dll' -delete
  find "$pkgdir/usr/share/$pkgname/" -name '*.exe' -delete
  rm -f "$pkgdir/usr/share/$pkgname/vk_swiftshader_icd.json"

  # Add linux stuff
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D "$pkgdir/usr/share/$pkgname/img/logo-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
