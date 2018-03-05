# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180305
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1520269849/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1520269858/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1520269860/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1520269852/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1520269853/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1520269856/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-aliz.tar.xz")

sha256sums=('1b580a7cf8a3b660d33916bc002f7b5baaccfb65923d94dfb7db043902b0c1f8'
            'b9f90b4e3fc66d2f28190a685083125c0bbd83cac2dca1912e1e43bd4613aa27'
            '7dfcbd59a18310ddbfdd3dce085780fb4cea4be6323ae50ba61ebdcf122e15d6'
            'f7d4f6a8830d414a04b5a25564d663beadf2480831dd9e54f52c217439de03bc'
            'e808e530a0208b1c62b8389a853caf16cd493b350fbaa1592283daeb9dba256c'
            'fde47233b23bf4963ebdeb9026c97fb8ee06ec6db8b26e2efe152b041ea525bf')


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

