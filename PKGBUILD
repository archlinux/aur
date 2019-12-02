# Maintainer: Ward Segers <w@rdsegers.be>
# Contributer: grimi <grimi at poczta dot fm>

pkgname=matcha-icon-theme
pkgver=20191202
pkgrel=1
pkgdesc="A Matcha icon theme based on Arc"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-update-icon-cache')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1517242250/s/${_hash_time[0]}/t/${_hash_time[1]}/Matcha-icon-theme.tar.xz")

sha256sums=('067193e09a3ec9058717bd93b9a64e74dcd66f6ff9c60e5193d1729a39fe3086')


prepare() {
   sed -i 's/Arc/Matcha/; s/\(Moka,\)/\1elementary,/' Matcha/index.theme
}

package() {
   find Matcha/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
   find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/icons/{}" \;
}

