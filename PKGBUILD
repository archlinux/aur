# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180305
pkgrel=2
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1521038213/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1521038205/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1521038204/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1521038212/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1521038209/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1521038208/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-aliz.tar.xz")

sha256sums=('5a480b1f31215b270fb54b073ec48fe4a8276103d5de26d03f57a8a16db708d7'
            'c3a243270bef6acaaea34cad5682c05622386f499aff2e9868d714f63d7d1b88'
            'be238e668d2a8191a336eef4d7ae2c29f55b27b80746c2cd3ea4fe8ab1d3b85a'
            'd18cf75b4b4d0ea7eb59ded8071d90c3e2f3546aaad9af10504e88bbd3b852e2'
            'c797fb6f813da44387c70f7439a2084533d0a41c836ba587fc5de3be6741992d'
            '3b1c9c5608508be2deb1af1d5aace9521ed9d996e655b8136e8d982c2c87a07b')

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
