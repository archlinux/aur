# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=3.1
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1514472283/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha.tar.xz"
        "${pkgname}-dark-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1514472284/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark.tar.xz")
sha256sums=('3ae3021b3e27bfdb26e1e57c77d07ab3ceb8adcde476022fa5a3350cb36cd8f6'
            '6f3fd1d970f737386d7cb500c35abba616b28a716f59fd64c3a6bee0c405840b')


prepare() {
   sed -i 's/\(menu.border.width:\).*$/\1 1/' Matcha{,-dark}/openbox-3/themerc
}

package() {
   find Matcha{,-dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

