# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=gods
pkgver=0_8.D
pkgrel=1
pkgdesc='Gods Deluxe, remake of the platform game Gods by Bitmap Brothers'
arch=('x86_64' 'i686')
url='http://jotd.pagesperso-orange.fr/gods/'
license=('custom')
makedepends=('java-runtime' 'unzip' 'setconf' 'gendesk')
source=("http://jotd.pagesperso-orange.fr/gods/GodsDeluxe-${pkgver/./-}.zip"
        "gods.png::http://www.androidfreeware.net/software_images/gods.thumb.png")
noextract=("GodsDeluxe-${pkgver/./-}.zip")
sha256sums=('c620c162f4b5c66961472ee2922dd2a4e9bb2f6b8e70774c5daca0b78ac1b20c'
            'd40a00737cfcc82bb4b24110ac5d162da5dddf6041a5d83b94a2c0104ac3a2e3')

prepare() {
  rm -rf Gods; unzip -q "GodsDeluxe-${pkgver/./-}.zip"
  find Gods -type f -iname "*.bat" -delete
  find Gods -type f -iname "*.dll" -delete
  setconf Gods/gods.sh GODS_ROOT_DIR "/usr/share/gods"
  chmod +x Gods/scripts/gods_loader.sh
  gendesk -f
}

package() {
  install -d "$pkgdir/usr/share"
  cp -ru Gods "$pkgdir/usr/share/gods"
  install -Dm755 Gods/gods.sh "$pkgdir/usr/bin/gods"
  rm -f "$pkgdir/usr/share/gods/gods.sh"
  install -Dm644 Gods/readme.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
  install -Dm644 gods.desktop "$pkgdir/usr/share/applications/gods.desktop"
  install -Dm644 gods.png "$pkgdir/usr/share/pixmaps/gods.png"
}

# vim:set ts=2 sw=2 et:
