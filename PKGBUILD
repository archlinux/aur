# Maintainer: zen0x (amanchaitany@proton.me)

pkgname=abyssal-gtk-theme
pkgver=1.0.4
pkgrel=1
pkgdesc="Abyssal dark GTK theme for GTK 3, GTK 4, and Libadwaita"
arch=(any)
url="https://github.com/zen0x00/abyssal-gtk-theme"
license=(GPL-3.0-or-later)
depends=(gtk3 gtk4 libadwaita)
makedepends=(sassc)
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zen0x00/abyssal-gtk-theme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/abyssal-gtk-theme-$pkgver"

  sassc -M -t expanded src/main/gtk-3.0/gtk.scss gtk-3.0.css
  sassc -M -t expanded src/main/gtk-4.0/gtk.scss gtk-4.0.css
  sassc -M -t expanded src/main/libadwaita/libadwaita.scss libadwaita.css
}

package() {
  cd "$srcdir/abyssal-gtk-theme-$pkgver"

  install -d "$pkgdir/usr/share/themes/Abyssal"

  install -d "$pkgdir/usr/share/themes/Abyssal/gtk-3.0"
  install -d "$pkgdir/usr/share/themes/Abyssal/gtk-4.0"
  install -d "$pkgdir/usr/share/themes/Abyssal/libadwaita"

  install -m644 gtk-3.0.css "$pkgdir/usr/share/themes/Abyssal/gtk-3.0/gtk.css"
  install -m644 gtk-4.0.css "$pkgdir/usr/share/themes/Abyssal/gtk-4.0/gtk.css"
  install -m644 libadwaita.css "$pkgdir/usr/share/themes/Abyssal/libadwaita/libadwaita.css"

  install -m644 index.theme "$pkgdir/usr/share/themes/Abyssal/index.theme"
}
