# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=3.6.1
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1517313712/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha.tar.xz"
        "${pkgname}-dark-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1517313715/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-dark.tar.xz")

sha256sums=('6bf970d269e5b79acc77060ca7e930fb1e97a1f950fb904877bef1c55fac7f44'
            '76ee699164327d5d0f23f6c4554930cef6b878596783d1dd25dbfaf39e8c41fc')


prepare() {
   sed -i 's/\(menu.border.width:\).*$/\1 1/' Matcha{,-dark}/openbox-3/themerc
   sed -i 's/\(menu.items.text.color:\).*$/\1 #d3c2c5/; s/\(menu.items.bg.color:\).*$/\1 #1f2729/;
         s/\(menu.border.color:\).*$/\1 #2d3036/; s/\(menu.seperator.color:\).*$/\1 #32353b/' \
         Matcha-dark/openbox-3/themerc
   sed -i 's/rgba(255, 255, 255, 0.3); }/rgba(0, 0, 0, 0.5); }/' Matcha/gtk-3.0/gtk.css
}

package() {
   find Matcha{,-dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha{,-dark}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

