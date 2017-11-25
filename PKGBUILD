# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2.6
pkgrel=2
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1511178505/Matcha-Theme.tar.xz")
sha256sums=('7c9205a6bd267239866778815a073c3197589b31f1abf8ad4d6eaf9ee8d6d3cb')

prepare() {
   cd Matcha-Theme/Matcha
   sed -i 's/\(menu.border.width:\).*$/\1 1/' openbox-3/themerc
   sed -i 's/\(bg\[NORMAL\] =\) "#e7e8eb"/\1 "#1b2224"/' gtk-2.0/menubar-toolbar/menubar-toolbar.rc
}

package() {
   cd Matcha-Theme
   find Matcha{,-Dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

