# Maintainer: <ayedeil at posteo dot com>
pkgname=bricklink-studio
pkgver=2.25.11_3
pkgrel=1
pkgdesc="Lego cad software created by Bricklink"
arch=('x86_64')
url="https://www.bricklink.com/v3/studio/download.page"
license=('custom')
depends=('wine')
makedepends=('innoextract')
source=(
  "$pkgname-$pkgver.exe::https://studio.download.bricklink.info/Studio2.0/Archive/$pkgver/Studio+2.0.exe"
  "$pkgname.sh"
  "$pkgname.desktop"
  "$pkgname.xml"
  "icon.png"
)
noextract=("$pkgname-$pkgver.exe")
sha256sums=('a3d3b9942bffcb5c28529c6ee13ba31d6a4302358becc314f5a80e5318bd8b08'
            '3656055a9d5a87238c9a206c8b1df5e4892b05f8dd797edf43c35041a5cbdc67'
            'cd760f9ad2a3210359ff6c0862cc3aa548a78a81246962748896f624364da47b'
            '799ebcbfd268cba96294f128abb2ea4b24f6841a8ee4863a10ef4ad4912419f3'
            'edfb03fbc30b6c39d0a63e5e04296a58439db44e2bc50434c270cdf441978927')
options=(!strip !debug)

prepare() {
  innoextract -d "$srcdir" "$pkgname-$pkgver.exe"
}

package() {
  install -Dd "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/app"/* "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/application-bricklink-studio-model.png"
}

