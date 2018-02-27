# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=20180228
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1519752012/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519752000/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519751997/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-aliz.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519752010/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-sea.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519752007/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-azul.tar.xz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1519752002/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark-aliz.tar.xz")

sha256sums=('47131a6c86fa874a4455118e4bca6fb25bd23d18b8b125930fe5e7f6114d13a1'
            'f68d4fc043aacddfcdcc324145ca850fcc5469f93b6cfbd9deac895e45fbaa51'
            '07bc015150e9b957e884c5aed80769f6ba91a100ceb6d16b2a5a8377e72600e0'
            '407c390147ab812418708a79c89a269a3f7af96db83713d5d2d3208932649b4e'
            '54923fa331a5e23baacee4f8e62173a262804dd389ffa9dd223fc9a1547dd4ba'
            '36f6281df90ec3b9632ef9797aa0bbc014f3a59ac0f21072e3327253af2ea9ba')


prepare() {
   local ori="#2f9b85" sea="#2eb398" azul="#3498db" aliz="#f0544c"
   #sed -i 's/\(menu.border.width:\).*$/\1 1/' Matcha-*/openbox-3/themerc
   sed -i 's/\(menu.items.text.color:\).*$/\1 #d3c2c5/; s/\(menu.items.bg.color:\).*$/\1 #1f2729/;
        s/\(menu.border.color:\).*$/\1 #2d3036/; s/\(menu.seperator.color:\).*$/\1 #32353b/' \
        Matcha-dark-*/openbox-3/themerc
   sed -i "s/$ori/$sea/Ig" Matcha{,-dark}-sea/openbox-3/themerc
   sed -i "s/$ori/$azul/Ig" Matcha{,-dark}-azul/openbox-3/themerc
   sed -i "s/$ori/$aliz/Ig" Matcha{,-dark}-aliz/openbox-3/themerc
}

package() {
   find Matcha{,-dark}-{sea,azul,aliz}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}-{sea,azul,aliz}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

