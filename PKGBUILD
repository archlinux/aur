# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180407
pkgrel=4
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1523109799/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1523109793/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1523109726/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1523109797/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1523109795/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-azul.tar.xz"
 	      "https://dl.opendesktop.org/api/files/downloadfile/id/1523109794/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-aliz.tar.xz")

sha256sums=('6bf301e847f35a766376da239099a0950cdeae283dc5e9d7aef90acabc873541'
            'e3eb26909ff111cbbcc1e918f39187f9249698ff7cb594782e21ecfcbf973945'
            'cb208fed259953f7733c26956247d8eb20b46fd550c7fe8fa5701b4aec7f2dd3'
            'be12ec299071619ede9865d94f32d72f74ccb0f32c43bbbd94e92090855e9fcc'
            '288dbdf009357ad61fee9e1d328294bd860522fffa86055bf5fc1190da343c81'
            '9063ca891903f8145af29e0e13597a30103821c0a98c986a4d8cc2cc0977df3a')

prepare() {
   sed -i 's/\(menu.items.text.color:\).*$/\1 #d3c2c5/; s/\(menu.border.color:\).*$/\1 #2d3036/;
      s/\(menu.seperator.color:\).*$/\1 #32353b/' Matcha-dark-*/openbox-3/themerc

   sed -i 's/\(menu.items.bg.color:\).*$/\1 #1f2729/' Matcha-dark-sea/openbox-3/themerc
   sed -i 's/\(menu.items.bg.color:\).*$/\1 #1b1d24/' Matcha-dark-azul/openbox-3/themerc
   sed -i 's/\(menu.items.bg.color:\).*$/\1 #222222/' Matcha-dark-aliz/openbox-3/themerc

   sed -i 's/#2f9b85/#2eb398/Ig' Matcha{,-dark}-sea/openbox-3/themerc
   sed -i 's/#2f9b85/#3498db/Ig' Matcha{,-dark}-azul/openbox-3/themerc
   sed -i 's/#2f9b85/#f0544c/Ig' Matcha{,-dark}-aliz/openbox-3/themerc
   sed -i 's/#1b2224/#1b1d24/Ig' Matcha{,-dark}-azul/openbox-3/themerc
   sed -i 's/#1b2224/#222222/Ig' Matcha{,-dark}-aliz/openbox-3/themerc
}

package() {
   find Matcha{,-dark}-{sea,azul,aliz}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}-{sea,azul,aliz}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}
