# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=3.6
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1517242052/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha.tar.xz"
        "${pkgname}-dark-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1517242055/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark.tar.xz")

sha256sums=('b2d8212a01fca0667fba3a81ed3e4473c127a2081c56e2b4de32a5cbd9f664ae'
            '5f7c4d6d2d80088d26d8abfc09908bfe7eda0660c69e17ac8c1856fe9323ceff')


prepare() {
   sed -i 's/\(menu.border.width:\).*$/\1 1/' Matcha{,-dark}/openbox-3/themerc
   sed -i 's/\(menu.items.text.color:\).*$/\1 #d3c2c5/; s/\(menu.items.bg.color:\).*$/\1 #1f2729/;
         s/\(menu.border.color:\).*$/\1 #2d3036/; s/\(menu.seperator.color:\).*$/\1 #32353b/' \
         Matcha-dark/openbox-3/themerc
   sed -i 's/rgba(255, 255, 255, 0.3); }/rgba(0, 0, 0, 0.3); }/' Matcha/gtk-3.0/gtk.css
}

package() {
   find Matcha{,-dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

