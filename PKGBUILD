# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20190310
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1552201134/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1552201139/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1552201209/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1552201168/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1552201215/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1552201145/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1517242250/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-icon-theme.tar.xz")

sha256sums=('619862130fb86ae4a2cba8c367612d3d292b966ba8ec5aba70c3fab9e588f0ac'
            'e8696c5870a6bc9de60057ba621857c664f2a93f786229e4e7167dc10a760c02'
            '86669c86fe885c492f62471a90c51d8bddcb406fd13576f90b3b45c7ea46a3f5'
            'bfc0a2fe24a452c910c410a9185bc2ae4408e3d013ddae0408a7b7eebb4a9945'
            'f3ba8ce4d51fda1017be0c6c970bb68c3ca147e3dadeec014f1a3110a900287b'
            '672b30f47cf9226ee4e24694889cb38ccd1660df3639656384fc77425e37523a'
            '067193e09a3ec9058717bd93b9a64e74dcd66f6ff9c60e5193d1729a39fe3086')

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
