# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180926
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1537968068/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1537968059/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1537968057/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1537968067/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1537968064/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1537968061/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Matcha-dark-aliz.tar.xz")

sha256sums=('01a9965a6d452d8f999cdf72704bacc9aae86e5580cc2be4f93780c6c24f898e'
            '61a075c32bbbed3667565373a415692bea256ec55e643c093f860eaa743d1c89'
            '0562ffdf81237741376f061d1ee5f70d7999f4d04fe0b85394d279a95e53347f'
            '903855a8b80f7d77783cd176b3893a365480e4ce98729b12362f4f5a383b931e'
            '0ef834440476ef565a33b6d57621ed03e29ba2b8ef825bc46692cacd2120ba41'
            'b8803b60cf58030da46bfa3dae5197e91feb7524a9e7cc8945e4d3b9d27d79fd')

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
