# Maintainer: Phaylali <admin@omniversify.com>

pkgname=envirify-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Material 3 GUI to view and edit every environment variable on your system — Arch GUI Environment Manager by Omniversify'
arch=('x86_64')
url='https://github.com/phaylali/envirify'
license=('Unlicense')
depends=('gtk3')
makedepends=()
provides=('envirify')
conflicts=('envirify')
options=('!strip' '!lto' '!debug')
source=("$pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/envirify-$pkgver-linux-x86_64.tar.zst"
        "envirify.desktop::$url/raw/v$pkgver/packaging/envirify.desktop"
        "envirify.png::$url/raw/v$pkgver/assets/icon-256.png")
sha256sums=('499871944722232eae1c2ddb30be9c133ef0d455679d165a2b391c1f5cccf39e'
            '1ce23bfa235a1a740c09c188bdbbff4305287a463a37b3a33bc96b133e1c4a9e'
            '2c87a16962a47685b897430bb0851804aec84daa9940bf890152abe7389487ab')

package() {
  # The release bundle extracts straight into $srcdir:
  #   envirify  lib/  data/
  install -Dm755 envirify "$pkgdir/opt/envirify/envirify"
  cp -a lib data "$pkgdir/opt/envirify/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/envirify/envirify "$pkgdir/usr/bin/envirify"

  install -Dm644 envirify.desktop "$pkgdir/usr/share/applications/envirify.desktop"
  install -Dm644 envirify.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/envirify.png"
}
