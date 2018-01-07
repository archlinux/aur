# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=3.2
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1515321780/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha.tar.xz"
        "${pkgname}-dark-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1515321784/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark.tar.xz")
sha256sums=('0a19ba301c2bb9e44696065703076167f074a834e66e18b55e78494782d15cb6'
            'fe9905ea7452df07eda8dad4acd2bb92faa700dde2464bd3965de749d3b0fb4a')


prepare() {
   mkdir build
   mv Matcha/Matcha build
   mv Matcha-dark/Matcha-dark build
   sed -i 's/\(menu.border.width:\).*$/\1 1/' build/Matcha{,-dark}/openbox-3/themerc
}

package() {
   cd build
   find Matcha{,-dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

