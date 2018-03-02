# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180302
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1519962314/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519962308/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519962307/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519962313/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519962311/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519962310/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-aliz.tar.xz")

sha256sums=('10a2c4a3d92fb4c50cc97eff1f1edd7b2d741c9b14bbf90b69755b9d21b1dec4'
            'b3b05e077bac560c19b06bfc295770e0a790ec226c0679427efa81b52bc35979'
            '889ab0fa2273b256d2024708710e707869220bbd77f11ec2e74ce5a29039bf07'
            'ea2e1fddd915248f65159aaec3bf483c8ae73789b50e5389b4097eabb2f75f77'
            'a087aca6822ad1ecc8158f1a0170a36674135ae54fffc6dde4e817d0aeff8b18'
            '0ae8e72284d2df20d4e9b81fec39861e4f43cb93a9d16e6b6762f03860f3a67c')


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

