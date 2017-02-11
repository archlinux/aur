# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=gods
pkgver=0.9
pkgrel=1
pkgdesc='Gods Deluxe, remake of the platform game Gods by Bitmap Brothers'
arch=('any')
url='http://jotd.pagesperso-orange.fr/gods/'
license=('custom')
depends=('java-runtime')
makedepends=('setconf')
optdepends=('gods-extra-music: mp3 music pack')
source=("https://jotd.pagesperso-orange.fr/gods/GodsDeluxe-${pkgver/./_}.zip"
        "gods.png::http://www.androidfreeware.net/software_images/gods.thumb.png"
        "gods.desktop")
sha256sums=('38fe593a9ed361c65e4a4c36dd4940cde8c847849f1d5e9f15eb940089428a9c'
            'd40a00737cfcc82bb4b24110ac5d162da5dddf6041a5d83b94a2c0104ac3a2e3'
            '176170bb9642eaf3c37d9d393f122334ae5080c9f9a4b69eea27d49855aa41e0')

prepare() {
  find Gods -type f -iname "*.bat" -delete
  find Gods -type f -iname "*.dll" -delete
  setconf Gods/gods.sh GODS_ROOT_DIR "/usr/share/gods"
  chmod +x Gods/scripts/gods_loader.sh
}

package() {
  install -d "$pkgdir/usr/share"
  cp -r Gods "$pkgdir/usr/share/gods"
  install -Dm755 Gods/gods.sh "$pkgdir/usr/bin/gods"
  rm -f "$pkgdir/usr/share/gods/gods.sh"
  install -Dm644 Gods/readme.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
  install -Dm644 gods.desktop "$pkgdir/usr/share/applications/gods.desktop"
  install -Dm644 gods.png "$pkgdir/usr/share/pixmaps/gods.png"
}
