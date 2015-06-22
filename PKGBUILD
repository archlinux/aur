# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.0.2
pkgrel=1
pkgdesc='Open source clone of RollerCoaster Tycoon 2'
arch=('i686' 'x86_64')
url='https://github.com/IntelOrca/OpenRCT2'
license=('GPL3')
depends=('wine' 'gtk-update-icon-cache' 'desktop-file-utils')
install=openrct2.install
source=("https://github.com/OpenRCT2/OpenRCT2/releases/download/v${pkgver}/OpenRCT2-${pkgver}.zip"
        "https://raw.githubusercontent.com/OpenRCT2/OpenRCT2/v${pkgver}/resources/logo/icon_flag.svg"
        'openrct2'
        'openrct2.desktop')
noextract=(OpenRCT2-${pkgver}.zip)
md5sums=('393038bf20e00cb72532cacfe905f7a6'
         '699a31f7b0e7ab825445b5a05fd2c39e'
         'b750eaf997a27e981232b21a68fa868e'
         '035a407b940492c584c72f4f59f1bd69')

package() {
  cd "$srcdir"

  # Standard OpenRCT2 distribution files.
  install -dm755 "$pkgdir/usr/share/openrct2"
  unzip -d "$pkgdir/usr/share/openrct2" "OpenRCT2-${pkgver}.zip"

  # Linux is case sensitive!
  mv "$pkgdir/usr/share/openrct2/"{Data,data}
  mv "$pkgdir/usr/share/openrct2/data/"{Language,language}

  # ArchLinux-specific stuff (launcher, .desktop file and icon).
  install -Dm755 openrct2 "$pkgdir/usr/bin/openrct2"
  install -Dm644 openrct2.desktop "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"
}
