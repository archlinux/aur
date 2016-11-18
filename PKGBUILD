# Maintainer: ThePilot <afuturepilotis at gmail dot com>

pkgbase=vivacious-colors
pkgname=("$pkgbase-icon-theme" "$pkgbase-folder-addon")
pkgver=1.4
pkgrel=1
pkgdesc="A vivid and modern GTK icon theme"
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-icon-theme.html"
license=('CCPL:by-sa' 'GPL2')
options=('!strip')
noextract=("$pkgbase-icon-theme-$pkgver.tar.gz"
           "$pkgbase-folder-addon-$pkgver.tar.gz")
source=("$pkgbase-icon-theme-$pkgver.tar.gz::https://drive.google.com/uc?export=download&id=0B7iDWdwgu9QAdFNoQ1ZpaGZJSkU"
        "$pkgbase-folder-addon-$pkgver.tar.gz::https://drive.google.com/uc?export=download&id=0B7iDWdwgu9QAbXlKT2lRT3VBdzA"
        "update-manager-32.png")
sha256sums=('31b1a44bf9c7aa517a0bdf4150ab8005da21ba011e3b409501deaa80152e4af5'
            'd0d181cabfede9e8cfce8f4abb151be8dd759fa08b9b7b077e61ea44abaf7659'
            '33fb762bc15b11ee542fc5ce425f26fa253a97557bacadd0f3e175a47af7d99c')

prepare() {
  mkdir $pkgbase-icon-theme-$pkgver
  tar -xf $pkgbase-icon-theme-$pkgver.tar.gz -C $pkgbase-icon-theme-$pkgver

  mkdir $pkgbase-folder-addon-$pkgver
  tar -xf $pkgbase-folder-addon-$pkgver.tar.gz -C $pkgbase-folder-addon-$pkgver
}

package_vivacious-colors-icon-theme() {
  cd $pkgbase-icon-theme-$pkgver

  install -d "$pkgdir"/usr/share/icons
  cp -r Vivacious-* "$pkgdir"/usr/share/icons

  install -Dm644 "Copyrights&Licenses.txt" \
    "$pkgdir/usr/share/licenses/$pkgbase-icon-theme/Copyrights&Licenses.txt"

  # fix permissions
  chmod 644 "$pkgdir"/usr/share/icons/Vivacious-Colors-Full-Dark/actions/scalable/go-home.svg
  chmod 644 "$pkgdir"/usr/share/icons/Vivacious-Colors-Full-Dark/actions/scalable/document-open-recent.svg

  # add missing icon
  install -m 644 ../update-manager-32.png "$pkgdir"/usr/share/icons/Vivacious-Colors-Dark/apps/32/update-manager.png
}

package_vivacious-colors-folder-addon() {
  pkgdesc="Additional folder colors for the vivacious-colors icon theme"
  depends=('vivacious-colors-icon-theme')

  cd $pkgbase-folder-addon-$pkgver

  install -d "$pkgdir"/usr/share/icons
  cp -r Vivacious-* "$pkgdir"/usr/share/icons

  install -Dm644 "Copyrights&Licenses.txt" \
    "$pkgdir/usr/share/licenses/$pkgbase-folder-addon/Copyrights&Licenses.txt"
}
