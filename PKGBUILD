# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=3.0
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1514010146/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-Theme.tar.xz")
sha256sums=('f04dccf1a1aa432a32ac67719901aca309d7cddacfeed3355a7f34e1d937456f')


prepare() {
   cd Matcha-Theme/Matcha
   sed -i 's/\(menu.border.width:\).*$/\1 1/' openbox-3/themerc
}

package() {
   cd Matcha-Theme
   find Matcha{,-Dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

